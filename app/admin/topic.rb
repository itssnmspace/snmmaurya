ActiveAdmin.register Topic do
  menu parent: "Solutions"

  permit_params :title, :description, :position, :status, images_attributes: [:id, :data, :_destroy]

  index do
    column :title
    column :description
    column :position
    column :status
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title
      f.input :description, as: :html_editor
      f.has_many :images, allow_destroy: true do |ff|
        ff.input :data, as: :file, label: "Image", hint: image_tag(ff.object.data.url(:thumb))
      end
      f.input :position
      f.input :status
      f.actions
    end
  end

  filter :name
end