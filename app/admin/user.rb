ActiveAdmin.register User do
  menu parent: "Master"
  permit_params :email, :username, :password, :password_confirmation, :resume_pdf, :resume_doc, images_attributes: [:id, :data, :_destroy], profiles_attributes: [:id, :first_name, :last_name, :contact, :email, :about, :address_line_one, :address_line_two, :address_line_three, :city, :state, :pin_code, :my_country, :status, :position, :_destroy] 
  
  action_item :only => :index do
    link_to 'Download Users', downloader_downloads_path
  end

  index do
    column :id
    column :email
    column :username
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :email
      f.input :username
      f.input :password
      f.input :password_confirmation
      f.input :resume_pdf, as: :file, label: "Resume PDF", hint: image_tag(f.object.resume_pdf.url(:thumb))
      # f.input :resume_doc, as: :file, label: "Image", hint: image_tag(f.object.resume_doc.url(:thumb))
      f.has_many :images, allow_destroy: true do |ff|
        ff.input :data, as: :file, label: "Image", hint: image_tag(ff.object.data.url(:thumb))
      end
      f.has_many :profiles, allow_destroy: true do |ff|
        ff.input :first_name
        ff.input :last_name
        ff.input :contact
        ff.input :email
        ff.input :about
        ff.input :address_line_one
        ff.input :address_line_two
        ff.input :address_line_three
        ff.input :city
        ff.input :state
        ff.input :pin_code
        # ff.input :my_country
        ff.input :position
        ff.input :status
      end
      f.actions
    end
  end

end