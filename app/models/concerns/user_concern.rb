# require 'active_support/concern'

module UserConcern
  extend ActiveSupport::Concern

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def user_options
      User.all.map{|user| [user.username, user.id]}
    end
  end
end