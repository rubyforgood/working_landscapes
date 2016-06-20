class Taxon < ActiveRecord::Base

  def to_s
    "#{scientific_name} (#{common_name})"
  end

end
