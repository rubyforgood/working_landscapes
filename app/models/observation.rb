class Observation < ActiveRecord::Base
  belongs_to :protocol, class_name: "SurveyProtocol"

  belongs_to :subsite
  has_one :site, through: :subsite

  has_many :samples
end
