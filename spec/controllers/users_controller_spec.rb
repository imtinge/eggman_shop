require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context 'signup' do

    it 'failed without a password and password_confirmation' do
      post :create, params: { user: { email: 'eggman' } }
      expect(response).to render_template('new')
    end

    it 'successed with a email, password and password_confirmation' do
      post :create, params: { user:
        {
          email: 'eggman@exmaple.com',
          password: '111111',
          password_confirmation: '111111'
        }
      }
      expect(response).to redirect_to new_session_path
    end
  end
end
