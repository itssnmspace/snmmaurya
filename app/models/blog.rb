class Blog < ApplicationRecord
  include FinderConcern

  belongs_to :user
  has_many :comments


  searchable do
    text :title, :description

    text :comments do
      comments.map{|comment| comment.description}
    end

    integer :user_id
    boolean :featured
    boolean :status
    time :created_at
    time :updated_at
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
end
