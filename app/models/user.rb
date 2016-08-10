class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include UserConcern
  include FinderConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github, :facebook, :twitter, :linkedin, :google, :amazon]

  has_many :images, as: :imageable
  has_many :topics
  has_many :projects
  has_many :employments
  has_many :educations
  has_many :technologies
  has_many :portfolios
  has_many :profiles
  belongs_to :role

  has_many :user_problems
  has_many :problems, through: :user_problems, dependent: :destroy

  has_many :user_solutions
  has_many :solutions, through: :user_solutions, dependent: :destroy

  has_many :blogs
  has_many :comments

  accepts_nested_attributes_for :profiles, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true


  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }


  has_attached_file :resume_pdf,
  :storage => :s3,
  :s3_region => "ap-south-1",
  :s3_credentials => "#{::Rails.root.to_s}/config/aws.yml",
  :s3_permissions => "public-read",
  :url => ':s3_alias_url',
  :path => "/:class/:attachment/:id_partition/:style/:filename",
  :s3_host_alias => Settings.cloud_front_url,
  :s3_protocol => :https,
  :s3_headers => {'Expires' => (Time.now + 60*60*24*30*12).httpdate}

  validates_attachment :resume_pdf, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }


  def master?
    self.role.try(:title) == "master"
  end

  # {provider: auth.provider, uid: auth.uid, email: auth.info.email, username: auth.info.name.parameterize}
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.username = auth.info.name.parameterize
      user.role_id = Role.role_id_by_title("user")
      user.password = Devise.friendly_token[0,20]
    end
  end


#****************************************************************************#
  #START Seo Related Functions
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    return if self.username.blank?
    [
      [:username],
      [:username, :id]
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