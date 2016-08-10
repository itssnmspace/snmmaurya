class StudiesController < ApplicationController
  before_action :set_study, only: [:edit, :update, :destroy]

  def index
    @studies = Study.all.page(params[:page]).per(10)
  end

private
    def set_study
      @study = Study.find(params[:id])
    end
end
