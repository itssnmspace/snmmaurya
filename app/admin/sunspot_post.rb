ActiveAdmin.register SunspotPost do
  menu parent: "Sunspot"
  permit_params :title, :description, :sunspot_post_category_id, :user_id, :status, :featured

  index do
    column :id
    column :title
    column :description
    column :sunspot_post_category_id
    column :featured
    column :status
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title
      f.input :description
      f.input :sunspot_post_category_id, as: :select, collection: SunspotPostCategory.sunspot_post_category_options
      f.input :user_id, as: :select, collection: User.user_options
      f.input :featured
      f.input :status
      f.actions
    end
  end

  filter :title
  filter :sunspot_post_category_id
  filter :featured
  filter :status
end