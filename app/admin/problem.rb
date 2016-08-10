ActiveAdmin.register Problem do
  menu parent: "Solutions"

  permit_params :title, :description, :status, :featured, :topic_id

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
      f.actions
    end
  end

  filter :title
end