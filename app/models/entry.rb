class Entry < ActiveRecord::Base
  belongs_to :sample
  belongs_to :taxa, class_name: "Taxon"

end
