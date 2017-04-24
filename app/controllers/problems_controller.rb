class ProblemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_topic
  before_action :set_problem, only: [:update, :show, :edit, :destroy]
  before_action :set_search, only: [:index]

  def index
    if @search.present?
      @problems = Problem.search(@search, where: {topic_id: @topic.id})
    else
      @problems = @topic.problems.active
    end
  end

  def set_search
    @search = params[:search]
  end  

  def show
   @solution_counter = @problem.solutions.count
  end

  def new
    @problem = Problem.new
  end
  
  def create
    @problem = current_user.problems.new(problem_params)
    if @problem.save
      flash[:success] = "Created Successfully!"
      redirect_to topic_problem_path(@topic, @problem)
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @problem.update(problem_params)
      flash[:success] = "Updated Successfully!"
      redirect_to topic_problem_path(@topic, @problem)
    else
      render :edit
    end
  end

  def destroy
    if @problem.destroy
      flash[:success] = "Deleted Successfully!"
      redirect_to topic_problems_path(@topic)
    else
      flash[:alert] = "Unable to delete!"
      redirect_to topic_problems_path(@topic)
    end  
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def problem_params
    params.require(:problem).permit(:title, :topic_id, :featured, :description)
  end  

  def set_problem
    @problem = Problem.find(params[:id])
  end  
end


# if params[:search].present?
#   Problem.search do
#   fulltext params[:search]

#   with :blog_id, 1
#   with(:published_at).less_than Time.now
#   field_list :blog_id, :title
#   order_by :published_at, :desc
#   paginate :page => 2, :per_page => 15
#   facet :category_ids, :author_id
#   end
# end