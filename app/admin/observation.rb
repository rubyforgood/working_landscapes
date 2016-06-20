ActiveAdmin.register Observation do
  permit_params :name, :date, :protocol_id, :site_id 

  def to_s
    "{protocol.name}--#{site.name}--#{date}"
  end

end
