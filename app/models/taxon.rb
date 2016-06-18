class Taxon < ActiveRecord::Base
  validates :family, presence: true
end
