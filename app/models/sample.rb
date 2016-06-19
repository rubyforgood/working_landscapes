class Sample < ActiveRecord::Base
  belongs_to :observation
  has_many :entries
  belongs_to :subsite

  validates :name, presence: true
end
