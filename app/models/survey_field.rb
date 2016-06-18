class SurveyField < ActiveRecord::Base
  enum type: { dropdown: 0 }
end
