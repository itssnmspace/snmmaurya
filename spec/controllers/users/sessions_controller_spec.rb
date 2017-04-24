require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  describe "loggin user" do
    context "When password is correct" do
      it 'renders success' do
        user = FactoryGirl.create(:user)
        post :create, user: { email: user.email, password: 'password' }

        # expect(response).to render_template(:new)
        expect(flash[:notice]).to match(/^Signed in success!/)
      end
    end
  end
end
# snm@snmmaurya.com
# snmmaurya