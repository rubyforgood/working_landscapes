class Subsite < ActiveRecord::Base
  belongs_to :site

  def property
    site&.property
  end
end
