class Employment < ApplicationRecord
  belongs_to :user
  scope :active, -> {where(status: true)}

  def get_started_at
    self.started_at
  end

  def get_end_at
    self.end_at
  end
end