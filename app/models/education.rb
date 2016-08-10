class Education < ApplicationRecord
  belongs_to :user
  scope :active, -> {where(status: true)}

  def get_started_at
    self.started_at
  end

  def get_completed_at
    self.completed_at
  end
end