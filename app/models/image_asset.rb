class ImageAsset < ApplicationRecord
  has_attached_file :data,
    :storage => :cloudinary,
    :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
    styles: { medium: "300x300>", thumb: "100x100>", original: ["100%"] },
    #Attention please specify path and url in case of cloudinary
    :path => 'uploads/image_assets/:id/:filename.:extension',
    :url => '/:class/:id/:filename.:extension'

  validates_attachment_content_type :data, content_type: /\Aimage\/.*\z/

  def self.image_asset_by_code image_asset_code
    self.find_by code: image_asset_code
  end
end