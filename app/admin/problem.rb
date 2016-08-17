ActiveAdmin.register Problem do
  menu parent: "Solutions"

  permit_params :title, :description, :status, :featured, :topic_id, :meta_title, :meta_description, :meta_keywords

  index do
    column :id
    column :title
    column :description do |problem|
      problem.description.truncate(100) if problem.description.present?
    end
    column :featured
    column :status
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :topic_id, as: :select, collection: Topic.topic_options
      f.input :title, as: :string
      f.input :description, as: :html_editor
      f.input :position
      f.input :correct
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