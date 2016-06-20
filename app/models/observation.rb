class Observation < ActiveRecord::Base
  belongs_to :protocol, class_name: "SurveyProtocol"
  belongs_to :site
  has_many :samples

  def to_s
    "#{protocol.title}--#{site.name}--#{date}"
  end

end
