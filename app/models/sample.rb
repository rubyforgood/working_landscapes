class Sample < ActiveRecord::Base
  belongs_to :observation
  has_many :entries
end
