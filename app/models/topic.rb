class Topic < ApplicationRecord
  include FinderConcern

  has_many :images, as: :imageable
  has_many :problems
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :active, -> {where(status: true)}

  def self.topic_options
    self.all.map{|topic| [topic.title, topic.id]}
  end

#****************************************************************************#
  #START Seo Related Functions
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    return if self.title.blank?
    [
      [:title],
      [:title, :id]
    ]
  end
  #END Seo Related Functions

  #Override slug creator method of friendly_id
  def resolve_friendly_id_conflict(candidates)
    candidates.first + friendly_id_config.sequence_separator + SecureRandom.uuid
  end

  #Override slug creator method of friendly_id
  def set_slug(normalized_slug = nil)
    if should_generate_new_friendly_id?
      candidates = FriendlyId::Candidates.new(self, normalized_slug || send(friendly_id_config.base))
      slug = slug_generator.generate(candidates) || resolve_friendly_id_conflict(candidates)
      send "#{friendly_id_config.slug_column}=", slug
    end
  end
#****************************************************************************#

  # def self.find topic_id
  #   if topic_id.is_a? Numeric
  #     Topic.find_by id: topic_id
  #   else
  #     Topic.find_by slug: topic_id
  #   end  
  # end  
end