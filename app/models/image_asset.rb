class ImageAsset < ApplicationRecord
  has_attached_file :data,
    styles: {profile: "500x250", medium: "250x200", thumb: "100x100#" },
    storage: :cloudinary,
    cloudinary_credentials: Rails.root.join("config/cloudinary.yml"),
    #Attention please specify path and url
    :path => ':class/:updated_at.:style.:extension'

  validates_attachment_content_type :data, content_type: /\Aimage\/.*\z/

  def self.image_asset_by_code image_asset_code
    self.find_by code: image_asset_code
  end
end