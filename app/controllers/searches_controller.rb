class SearchesController < ApplicationController
  def index
    @searches = Search.welcome(params[:query])
  end

  def show
    @search = Search.find params[:id]
  end

  def new
  end

  def create
    @search = Search.new search_params
    if @Search.save
      redirect_to @search
    else
      render 'new'
    end
  end

  private
    def search_params
      params.require(:search).permit(:title, :description)
    end
end