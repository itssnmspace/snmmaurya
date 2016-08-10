ActiveAdmin.register Portfolio do
  menu parent: "Profiles"

  permit_params :title, :tools, :url, :description, :user, images_attributes: [:id, :data, :_destroy]

  index do
    column :id
    column :title
    column :description
    column "Images" do |portfolio|
      image = portfolio.images.last
      image_tag(image.data.url(:thumb)) if image.present?
    end
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title
      f.input :url
      f.input :tools
      f.input :description, as: :html_editor
      f.has_many :images, allow_destroy: true do |ff|
        ff.input :data, as: :file, label: "Image", hint: image_tag(ff.object.data.url(:thumb))
      end
      f.actions
    end
  end

  show do |portfolio|
    attributes_table do
      row :id
      row :title
      row :url
      row :tools
      row :description
      row "Image" do |portfolio|
        image_tag(portfolio.images.last.data.url(:original)) if portfolio.images.present?
      end  
    end
  end

  filter :title
end