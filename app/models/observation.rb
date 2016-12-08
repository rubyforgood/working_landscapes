class Observation < ActiveRecord::Base
  belongs_to :protocol, class_name: "SurveyProtocol"
  belongs_to :site
  has_many :samples

  def sample_field_names
    protocol.sample_fields.map {|field| field["label"]}
  end

end
