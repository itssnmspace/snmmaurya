class Solution < ApplicationRecord
  has_one :user_solution
  has_one :user, through: :user_solution, dependent: :destroy
  belongs_to :problem

  after_create :solution_information

   def solution_information
    SolutionsMailer.solution_information({
      subject: "Solution for you problem",
      user: self.user,
      problem: self.problem,
      solution: self
    }).deliver
  end

#****************************************************************************#

#****************************************************************************# 
end