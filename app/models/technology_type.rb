class TechnologyType < ApplicationRecord
  has_many :technologies
  scope :active, -> {where(status: true)}

  def self.technology_type_options
    self.active.map{|technology_type| [technology_type.title, technology_type.id]}
  end 
end
