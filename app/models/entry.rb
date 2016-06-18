class Entry < ActiveRecord::Base
  belongs_to :sample
  belongs_to :taxa, class_name: "Taxon"

  validates :name, presence: true
end
