class Entry < ActiveRecord::Base
  belongs_to :sample
  belongs_to :taxa

  validates :name, presence: true
end
