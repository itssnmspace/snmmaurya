ActiveAdmin.register Study do
  menu parent: "Studies"

  permit_params :title, :description, :status, :featured, images_attributes: [:id, :data, :_destroy]

  index do
    column :id
    column :title
    column :description do |study|
      study.description.truncate(100)
    end  
    column :featured
    column :status
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title, as: :string
      f.input :description, as: :html_editor
      f.has_many :images, allow_destroy: true do |ff|
        ff.input :data, as: :file, label: "Image", hint: image_tag(ff.object.data.url(:thumb))
      end
      f.input :featured
      f.input :status
      f.actions
    end
  end

  filter :title
end