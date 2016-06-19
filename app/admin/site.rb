ActiveAdmin.register Site do
  permit_params :name, :property_id

  index do
    column :name
    column :propert_id
    actions
  end 

  filter :name
  filter :propert_id

  form do |f| 
    f.inputs "Site Details" do
      f.input :name
      f.input :propert_id
    end 
    f.actions
  end 
end
