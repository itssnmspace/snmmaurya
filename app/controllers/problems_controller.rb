class ProblemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :topic

  def index
    topic_id = @topic.id
    @search = Problem.solr_search do
      fulltext params[:search]
      with :topic_id, topic.id
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 10
    end
    @problems = @search.results
  end

  def show
   @problem = Problem.find params[:id]
   @solution_counter = @problem.solutions.count
   @solution = Solution.new
  end

  def new
    @problem = Problem.new
  end
  
  def create
    @problem = current_user.problems.new(topic_params)
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

  end

  def destroy

  end

  def topic
    @topic = Topic.find(params[:topic_id])
  end

  def topic_params
    params.require(:problem).permit(:title, :topic_id, :featured, :description)
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