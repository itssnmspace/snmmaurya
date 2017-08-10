class Spa::SpaController < ApplicationController
  layout 'spa'

  def index
    @working = "yes"
  end
end