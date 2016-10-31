ActiveAdmin.register Rubyist do
  menu parent: "Rubyist"

  permit_params :title, :description, :status, :featured, :meta_title, :meta_description, :meta_keywords

  index do
    column :id
    column :title
    column :description do |rubyist|
      rubyist.description.truncate(100)
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
      f.input :featured
      f.input :status
    end
    f.inputs "Seo Settings" do
      f.input :meta_title
      f.input :meta_keywords
      f.input :meta_description
    end
    f.actions
  end

  filter :title
end