class Entry < ActiveRecord::Base
  belongs_to :sample
  belongs_to :taxon

end
