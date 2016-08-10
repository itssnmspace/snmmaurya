class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.active
  end

  def show
    @portfolio = Portfolio.find params[:id]
    if request.xhr?
      render layout: false
    else
      redirect_to welcome_index_path
    end
  end
end