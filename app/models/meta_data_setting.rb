class MetaDataSetting < ApplicationRecord
  validates :site_url, :meta_title, :meta_keywords, :meta_description, presence: true
end
