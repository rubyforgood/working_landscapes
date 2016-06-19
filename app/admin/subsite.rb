ActiveAdmin.register Subsite do
  permit_params :name, :site_id

  index do
    column :name
    column :site_id
    actions
  end 

  filter :name
  filter :site_id

  form do |f| 
    f.inputs "Property Details" do
      f.input :name
      f.input :site_id
    end 
    f.actions
  end 
end
