class Api::V1::SolutionsController < ApiController
  before_action :topic, :problem

  def create
    @solution = current_user.solutions.new(solutions_params)
    unless @solution.save
      @options = {message: "Unable to create"}
      render partial: "ap/v1/failure" 
    end
  end

  
  def topic
    @topic = Topic.find(params[:topic_id])
  end

  def problem
    @problem = Problem.find(params[:problem_id])
  end  

  def solutions_params
    params.require(:solution).permit(:title, :description, :problem_id, :featured)
  end
end
