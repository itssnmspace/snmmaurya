ActiveAdmin.register Education do
  menu parent: "Profiles"
  permit_params :cource, :college, :location, :description, :user_id, :started_at, :completed_at, :status, :position

  index do
    column :id
    column :cource
    column :college
    column :user do |education|
      education.user.try(:username)
    end
    column :started_at
    column :completed_at
    column :position
    column :status
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :cource
      f.input :college
      f.input :location
      f.input :description, as: :html_editor
      f.input :user_id, as: :select, collection: User.user_options
      f.input :started_at, as: :date_time_picker
      f.input :completed_at, as: :date_time_picker
      f.input :position
      f.input :status
      f.actions
    end
  end

  filter :cource
end