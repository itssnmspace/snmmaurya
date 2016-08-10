class Contact < ApplicationRecord
  validates :name, :email, :contact, :message, presence: true
  validates :contact, length: {minimum: 10, maximum: 13}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end