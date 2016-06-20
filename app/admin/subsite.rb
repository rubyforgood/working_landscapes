ActiveAdmin.register Subsite do
  permit_params :name, :site_id

  index do
    column :name
    column :site do |s|
      "#{s.property&.name} - #{s.name}"
    end
    actions
  end 

  filter :name
  filter :site, collection: ->{Site.select(:name,:id,:property_id).map{|s|
        ["#{s.property&.name} - #{s.name}",s.id]
      }}


  form do |f| 
    f.inputs "Property Details" do
      f.input :name
      f.input :site, collection: Site.select(:name,:id,:property_id).map{|s|
        ["#{s.property&.name} - #{s.name}",s.id]
      }
    end 
    f.actions
  end 
end
