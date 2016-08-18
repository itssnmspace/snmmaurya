class UsersController < ApplicationController
  def problems
    @problems = current_user.problems
  end

  def solutions
    @problems = current_user.solutions
  end
end