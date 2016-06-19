class SurveyProtocol < ActiveRecord::Base
  has_many :observations, foreign_key: :protocol_id
end
