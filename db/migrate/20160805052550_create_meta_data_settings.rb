class CreateMetaDataSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :meta_data_settings do |t|
      t.string :site_url
      t.string :meta_title
      t.text :meta_keywords
      t.text :meta_description
      t.boolean :meta_default, default: false
      t.timestamps
    end
    #Setup root meta data, works as default meta data.
    MetaDataSetting.where(
      site_url: "/",
      meta_title: "SnmMaurya | Ruby - Problem and Solution System",
      meta_keywords: "problems, solutions, answers, questions, answer, question, problem, solution, ruby, ruby on rail, jquery, snm maurya portfolio",
      meta_description: "A Ruby based problem and solution system. You can query a problem to get solution based on ruby , ruby on rails and so on.",
      meta_default: true
    ).first_or_create
  end
end