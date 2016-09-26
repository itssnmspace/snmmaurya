class ApiController < ApplicationController
  before_action :authentication


  private
    def authentication
      unless params[:authentication].present? && params[:authentication] == "snmmaurya"
        @options = {message: "authentication failed"}
        render partial: "api/v1/shared/failure"  
      end  
    end
end