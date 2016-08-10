class ImageAsset < ApplicationRecord
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
  
  validates_attachment_content_type :data, content_type: /\Aimage\/.*\Z/

  def self.image_asset_by_code image_asset_code
    self.find_by code: image_asset_code
  end
end