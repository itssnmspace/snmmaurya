require 'rails_helper'

RSpec.describe Api::V1::WelcomeController, type: :controller do
  describe "Get api/v1/welcome.json" do
    it "should success with authentication" do
      get :index, {authentication: "snmmaurya", format: "json"}
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")
      expect(response).to render_template(:index)

      #must has user as instance variable
      expect(assigns(:user)).not_to eq(nil)
    end
  end


  describe "Get api/v1/welcome.json" do
    it "should success without authentication" do
      get :index, {authentication: "wrong", format: "json"}
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")
      expect(response).to render_template("api/v1/shared/_failure")

      #must has options as instance variable shoule not be nil
      expect(assigns(:options)).not_to eq(nil)
    end
  end
end