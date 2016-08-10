ActiveAdmin.register ImageAsset do
  menu parent: "Master"

  permit_params :title, :code, :action, :target, :data

  index do
    column :id
    column :title
    column :code
    column "Images" do |image_asset|
      image_tag(image_asset.data.url(:thumb)) if image_asset.data.present?
    end
    column :status
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :code
      f.input :title
      f.input :action
      f.input :target
      f.input :data, as: :file, label: "Image", hint: image_tag(f.object.data.url(:thumb))
      f.actions
    end
  end
  filter :title
end