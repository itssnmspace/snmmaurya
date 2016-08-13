class Role < ApplicationRecord
  has_many :users

  def self.role_id_by_title role_title="master"
    self.find_by(title: role_title).try(:id)
  end
end