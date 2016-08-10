class LessionsController < ApplicationController
  before_action :set_study, :get_lessions, only: [:index, :show]

  def index
    if @lessions.present?
      @lession = Lession.friendly.find(params[:id].present? ? params[:id] : @lessions.first)
    end
  end

  def show
    
    if @lessions.present?
      @lession = Lession.friendly.find(params[:id].present? ? params[:id] : @lessions.first)
    end
  end

private
    def set_study
      @study = Study.find(params[:study_id])
    end

    def get_lessions
      @lessions = @study.lessions.page(params[:page]).per(10)
    end  
end
