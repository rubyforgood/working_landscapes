ActiveAdmin.register Site do
  permit_params :name, :property_id

  index do
    column :name
    column :property
    actions
  end 

  filter :name
  filter :property, collection: ->{Property.pluck(:name, :id)}

  form do |f| 
    f.inputs "Site Details" do
      f.input :name
      f.input :property, collection: Property.pluck(:name, :id)
    end 
    f.actions
  end

  action_item :view_protocols do
    link_to('Manage Protocols',"/survey_protocols")
  end
end
