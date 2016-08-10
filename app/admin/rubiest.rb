ActiveAdmin.register Rubiest do
  menu parent: "Rubiest"

  permit_params :title, :description, :status, :featured

  index do
    column :id
    column :title
    column :description do |rubiest|
      rubiest.description.truncate(100)
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
      f.actions
    end
  end

  filter :title
end