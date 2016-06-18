class Sample < ActiveRecord::Base
  belongs_to :subsite
  has_many :entries
  belongs_to :subsite
end
