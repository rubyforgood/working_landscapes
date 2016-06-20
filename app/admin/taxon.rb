ActiveAdmin.register Taxon do
  permit_params :name, :code, :common_name, :scientific_name

  def to_s
    "#{scientific_name} (#{common_name})"
  end

end
