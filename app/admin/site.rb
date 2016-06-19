ActiveAdmin.register Site do
  permit_params :name, :property_id

  index do
    column :name
    column :propert
    actions
  end 

  filter :name
  filter :propert, collection: Property.select(:id, :name).uniq.map {|a| [a.id, b.name]}

  form do |f| 
    f.inputs "Site Details" do
      f.input :name
      f.input :property, collection: Property.select(:id, :name).uniq.map {|a| [a.id, b.name]}
    end 
    f.actions
  end 
end
