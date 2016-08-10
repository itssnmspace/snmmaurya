class TopicsController < ApplicationController
  def index
    @topics = Topic.active
  end
end