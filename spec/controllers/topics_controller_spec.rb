require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  describe "GET => topics#index" do

    it "should be Success" do
      get :index
      expect(response).to be_success
      expect(response).to render_template("index")
    end
    

    it "assigns @topics" do
      get :index
      topic = Topic.create
      #topics instance variable must be an array of topic
      expect(assigns(:topics)).to eq([topic])
    end
  end
end