require 'elasticsearch/model'

class Search < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  

  def self.welcome(keyword)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: keyword,
            fields: ['title^10', 'description']
          }
        }
      }
    )
  end
end

Search.import #for auto sync model with elastic search