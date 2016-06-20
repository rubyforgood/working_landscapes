ActiveAdmin.register Sample do
  permit_params :observation_id, :subsite_id

  hstore_editor

  form do |f|
    f.inputs do
      f.input :response_data, as: :hstore
      f.input :observation
      f.input :subsite
    end

    f.actions
  end

end
