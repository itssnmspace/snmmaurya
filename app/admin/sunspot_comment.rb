ActiveAdmin.register SunspotComment do
  menu parent: "Sunspot"
  permit_params :description, :sunspot_post_id, :user_id, :status, :featured

  index do
    column :id
    column :description
    column :sunspot_post_id
    column :user_id
    column :featured
    column :status
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :description
      f.input :sunspot_post_id, as: :select, collection: SunspotPost.sunspot_post_options
      f.input :user_id, as: :select, collection: User.user_options
      f.input :featured
      f.input :status
      f.actions
    end
  end

  filter :description
  filter :sunspot_post_id
  filter :featured
  filter :status
end