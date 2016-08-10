class Portfolio < ApplicationRecord
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :active, -> {where(status: true)}
end