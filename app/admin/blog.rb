ActiveAdmin.register Blog do
  menu parent: "Master"
  permit_params :title, :description, :user_id, :status, :featured

  index do
    column :id
    column :title
    column :description
    column :user do |blog|
      blog.user.try(:username)
    end
    column :featured
    column :status
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title
      f.input :description, as: :html_editor
      f.input :featured
      f.input :user_id, as: :select, collection: User.user_options
      f.input :status
      f.actions
    end
  end

  filter :cource
end