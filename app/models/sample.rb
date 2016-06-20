class Sample < ActiveRecord::Base
  belongs_to :observation
  belongs_to :subsite
  has_many :entries

  def to_s
    "#{observation}--#{subsite.name}"
  end



end
