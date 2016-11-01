class Solution < ApplicationRecord
  has_one :user_solution
  has_one :user, through: :user_solution, dependent: :destroy
  belongs_to :problem

  after_create :solution_information_mailer_to_the_admin, :solution_information_mailer_to_user


  def solution_information_mailer_to_the_admin
    SolutionMailerJob.perform_later(self.id, {admin: true})
  end

  def solution_information_mailer_to_user
    SolutionMailerJob.perform_later(self.id, {admin: false})
  end
end