class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_attached_file :data,
    :storage => :cloudinary,
    :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
    styles: {profile: "470x250>", medium: "300x300>", thumb: "100x100>", original: ["100%"] },
    #Attention please specify path and url
    :path => 'uploads/image_assets/:id/:filename.:extension',
    :url => '/:class/:id/:filename.:extension'


  validates_attachment_content_type :data, content_type: /\Aimage\/.*\z/
end