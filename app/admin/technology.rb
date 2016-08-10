ActiveAdmin.register Technology do
  menu parent: "Profiles"

  permit_params :technology_type_id, :name, :description, :experience, :experience_level, :user_id, :status, :position

  index do
    column :name
    column :description
    column :experience
    column :position
    column :status
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :technology_type_id, as: :select, collection: TechnologyType.technology_type_options
      f.input :name
      f.input :description, as: :html_editor
      f.input :experience
      f.input :experience_level, as: :select, collection: [["Expert", "Expert"], ["Begginers", "Begginers"]]
      f.input :user_id, as: :select, collection: User.user_options
      f.input :position
      f.input :status
      f.actions
    end
  end

  filter :name
end