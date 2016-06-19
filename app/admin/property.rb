ActiveAdmin.register Property do
  permit_params :name, :address

  index do
    column :name
    column :address
    actions
  end 

  filter :name
  filter :address

  form do |f| 
    f.inputs "Property Details" do
      f.input :name
      f.input :address
    end 
    f.actions
  end 
end
