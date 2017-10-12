require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has no product' do
    expect(Product.count).to eq(0)
  end
end
