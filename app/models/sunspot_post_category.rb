class SunspotPostCategory < ApplicationRecord
  has_many :sunspot_posts

  scope :active, -> {where(status: true)}

  def self.sunspot_post_category_options
    self.active.map{|sunspot_post_category| [sunspot_post_category.title, sunspot_post_category.id]}
  end
end
