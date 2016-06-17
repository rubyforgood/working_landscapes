class Site < ActiveRecord::Base
  belongs_to :property

  has_many :subsites
end
