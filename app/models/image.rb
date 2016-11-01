class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_attached_file :data,
    styles: {profile: "500x250", portfolio: "470x250", solution: "520x250", small: "300x300", thumb: "100x100#" },
    storage: :cloudinary,
    cloudinary_credentials: Rails.root.join("config/cloudinary.yml"),
    #Attention please specify path and url
    :path => ':class/:id.:style.:extension'

  validates_attachment_content_type :data, content_type: /\Aimage\/.*\z/
end