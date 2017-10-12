class Admin::ProductsController < Admin::BaseController
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.page(params[:page] || 1).per_page(params[:per_page] || 10).
      order('id desc')
  end

  def new
    @product = Product.new
    @root_categories = Category.roots
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "创建成功"
      redirect_to admin_products_url
    else
      @root_categories = Category.roots
      render :new
    end
  end

  def edit
    @root_categories = Category.roots
  end

  def update
    if @product.update(product_params)
      flash[:notice] = '更新成功'
      redirect_to admin_products_path
    else
      @root_categories = Category.roots
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = "删除成功"
      redirect_to admin_products_path
    else
      flash[:notice] = "删除失败"
      redirect_back fallback_location: admin_products_url
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
