ActiveAdmin.register Comment, :as => "Blog Comments" do
  menu parent: "Master"
  permit_params :title, :description, :blog_id, :status

  index do
    column :id
    column :title
    column :description
    column "Blog" do |comment|
      comment.blog.title
    end  
    column :status
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :blog_id, as: :select, collection: Blog.blog_options
      f.input :title
      f.input :description, as: :html_editor
      f.input :status
      f.actions
    end
  end

  filter :title
end