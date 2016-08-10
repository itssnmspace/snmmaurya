class AboutController < ApplicationController
  def index
    @employments = Employment.active.order(:started_at)
    @educations = Education.active.order(:started_at)
    @technology_types = TechnologyType.includes(:technologies)
  end
end
