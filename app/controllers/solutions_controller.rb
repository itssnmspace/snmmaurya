class SolutionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :topic, :problem

  def new
    @solution = Solution.new
  end
  
  def create
    @solution = current_user.solutions.new(solutions_params)
    if @solution.save
      flash[:success] = "Created Successfully!"
      redirect_to topic_problem_path(@topic, @problem)
    else
      render :new
    end
  end

  def edit
    @solution = Solution.find params[:id]
  end

  def update
    @solution = Solution.find params[:id]
    if @solution.update(solutions_params)
      flash[:success] = "Updated Successfully!"
      redirect_to topic_problem_path(@topic, @problem)
    else
      render :new
    end
  end

  def destroy

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


# if params[:search].present?
#   Question.search do
#   fulltext params[:search]

#   with :blog_id, 1
#   with(:published_at).less_than Time.now
#   field_list :blog_id, :title
#   order_by :published_at, :desc
#   paginate :page => 2, :per_page => 15
#   facet :category_ids, :author_id
#   end
# end