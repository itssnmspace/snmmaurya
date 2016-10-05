class SunspotComment < ApplicationRecord
  belongs_to :sunspot_post
  belongs_to :user
end
