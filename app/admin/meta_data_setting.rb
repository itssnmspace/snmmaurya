ActiveAdmin.register MetaDataSetting do
  menu parent: "Master"
  actions :all

  permit_params :site_url, :meta_title, :meta_keywords, :meta_description

  filter :site_url
  filter :meta_title

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Seo Settings" do
      f.input :site_url, hint: "Only path not full url", input_html: {readonly: (f.object.present? && f.object.site_url=="/") ? true : false}
      f.input :meta_title, label: "Title", hint: "Maximum length should be 70 character"
      f.input :meta_keywords, label: "Keywords", hint: "Separate with comman and followed by a space and maximum length should be 255 character"
      f.input :meta_description, label: "Description", hint: "Maximum length should be 160 character"
    end
    f.actions
  end
end