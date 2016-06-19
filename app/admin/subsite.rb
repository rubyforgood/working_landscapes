ActiveAdmin.register Subsite do
  permit_params :name, :site_id

  index do
    column :name
    column :site
    actions
  end 

  filter :name
  filter :site, collection: Site.select(:id, :name).uniq.map {|a| [a.id, b.name]}

  form do |f| 
    f.inputs "Property Details" do
      f.input :name
      f.input :site, collection: Site.select(:id, :name).uniq.map {|a| [a.id, b.name]}
    end 
    f.actions
  end 
end
