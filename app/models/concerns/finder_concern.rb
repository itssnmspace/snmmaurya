# require 'active_support/concern'

module FinderConcern
  extend ActiveSupport::Concern

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def find topic_id
      if topic_id.is_a? Numeric
        self.find_by id: topic_id
      else
        self.find_by slug: topic_id
      end
    end
  end
end