class Technology < ApplicationRecord
  belongs_to :user
  belongs_to :technology_type
  scope :active, -> {where(status: true)}
end
