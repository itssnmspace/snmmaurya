ActiveAdmin.register SunspotPostCategory do
  menu parent: "Sunspot"
  permit_params :title, :status, :featured

  index do
    column :id
    column :title
    column :featured
    column :status
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title
      f.input :featured
      f.input :status
      f.actions
    end
  end

  filter :title
  filter :featured
  filter :status
end