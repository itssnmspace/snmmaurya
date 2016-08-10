class Problem < ApplicationRecord
  include FinderConcern

  has_one :user_problem
  has_one :user, through: :user_problem, dependent: :destroy

  has_many :solutions, dependent: :destroy
  belongs_to :topic

  validates :title, presence: true

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


#***************************************************************************#
#Solr Search
#***************************************************************************#
  searchable do
    text :title
    integer :topic_id
    text :solutions do
      solutions.map { |solution| solution.title }
    end
    time :created_at
  end
#***************************************************************************#
#END Solr Search
#***************************************************************************#  
end


=begin
  searchable do
    text :question, :body
    text :comments do
      comments.map { |comment| comment.body }
    end

    boolean :featured
    integer :blog_id
    integer :author_id
    integer :category_ids, :multiple => true
    double  :average_rating
    time    :published_at
    time    :expired_at

    string  :sort_title do
      title.downcase.gsub(/^(an?|the)/, '')
    end
  end
=end  