require 'rails_helper'

RSpec.describe Api::V1::SolutionsController, type: :controller do

  describe "Create a solution" do
    it "Should success on new action with an instance variable named:solution" do
      post topic_problem_solutions_path(1, 1), {solution: {title: "a", description: "b", problem_id: 1, featured: false}, solution_id: 1, problem_id: 1}
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")
      expect(response).to render_template(:craete)
    end 
    # it "Should create a solution of a problem" do
    #   # post :create 
    # end  
  end

end
