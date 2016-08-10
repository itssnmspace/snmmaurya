ActiveAdmin.register TechnologyType do
  menu parent: "Profiles"

  permit_params :title, :status, :position

  index do
    column :title
    column :status
    column :position
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title
      f.input :status
      f.input :position
      f.actions
    end
  end

  show do |portfolio|
    attributes_table do
      row :title
      row :status
      row :position
    end
  end

  filter :title
end