class SunspotPost < ApplicationRecord
  belongs_to :sunspot_post_caregory
  belongs_to :user
  has_many :sunspot_comments

  scope :active, -> {where(status: true)}

  def self.sunspot_post_options
    self.active.map{|sunspot_post| [sunspot_post.title, sunspot_post.id]}
  end

  searchable do
    text :title, :description

    text :sunspot_comments do
      sunspot_comments.map{|sunspot_comment| sunspot_comment.description}
    end

    integer :user_id
    boolean :featured
    boolean :status
    time :created_at
    time :updated_at
  end
end
