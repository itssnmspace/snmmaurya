class CreateMetaDataSocials < ActiveRecord::Migration[5.0]
  def change
    create_table :meta_data_socials do |t|
      t.belongs_to :meta_data_setting
      t.timestamps
    end
  end
end
