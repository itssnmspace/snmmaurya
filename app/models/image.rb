class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_attached_file :data, styles: { medium: "300x300>", thumb: "100x100>" },
  :storage => :s3,
  :s3_region => "ap-south-1",
  :s3_credentials => "#{::Rails.root.to_s}/config/aws.yml",
  :s3_permissions => "public-read",
  :url => ':s3_alias_url',
  :path => "/:class/:attachment/:id_partition/:style/:filename",
  :s3_host_alias => Settings.cloud_front_url,
  :s3_protocol => :https,
  :s3_headers => {'Expires' => (Time.now + 60*60*24*30*12).httpdate}
  # default_url: "/images/:style/missing.png",
  # url: "/controllers/:style/:basename.:extension",
  # path: ":rails_root/public/controllers/:style/:basename.:extension"


  validates_attachment_content_type :data, content_type: /\Aimage\/.*\Z/
end