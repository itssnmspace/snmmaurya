class AboutController < ApplicationController
  def index
    @employments = Employment.active.order(:position)
    @educations = Education.active.order(:position)
    @technology_types = TechnologyType.order(:position).includes(:technologies)
  end
end