class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_attached_file :data,
    :storage => :cloudinary,
    :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
    styles: { medium: "300x300>", thumb: "100x100>", original: ["100%"], profile: "470x250>" },
    #Attention please specify path and url
    :path => 'uploads/image_assets/:id/:filename.:extension',
    :url => '/:class/:id/:filename.:extension'


  validates_attachment_content_type :data, content_type: /\Aimage\/.*\z/
endprofile: "470"