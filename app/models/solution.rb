class Solution < ApplicationRecord
  has_one :user_solution
  has_one :user, through: :user_solution, dependent: :destroy
  belongs_to :problem

#****************************************************************************#

#****************************************************************************# 
end