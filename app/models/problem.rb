class Problem < ApplicationRecord
  include FinderConcern

  has_one :user_problem
  has_one :user, through: :user_problem, dependent: :destroy

  has_many :solutions, dependent: :destroy
  belongs_to :topic

  validates :title, :description, presence: true

  before_create :set_meta_data
  after_create :problem_information_mailer_to_the_admin, :problem_information_mailer_to_user

  scope :active, -> {where(status: true)}

  def problem_information_mailer_to_the_admin
    ProblemMailerJob.perform_later(self.id, {admin: true})
  end

  def problem_information_mailer_to_user
    ProblemMailerJob.perform_later(self.id, {admin: false})
  end

  #ActiveJob mailer
  # UserMailer.welcome_email(@user).deliver_later
  # UserMailer.welcome_email(@user).deliver_now
  # UserMailer.welcome_email(@user).deliver_later!(wait: 1.hour)

  def set_meta_data
    textual_description = ActionView::Base.full_sanitizer.sanitize(self.description)[0..200]
    self.meta_title = self.title
    self.meta_keywords = textual_description.gsub(" ", ",")
    self.meta_description = textual_description
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

  scope :search_import, -> { eager_load(:topic, :solutions)}
  searchkick batch_size: 1000, word_start: [:title, :description, :solution, :topic]


  def search_data
    {
      title: title,
      description: description,
      solution: solutions.map(&:title),
      topic: topic.title,
      topic_id: topic_id
    }
  end
  
end