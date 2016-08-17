class AddMetaToTables < ActiveRecord::Migration[5.0]
  def up
    execute "ALTER TABLE topics 
    ADD COLUMN meta_title varchar(255),
    ADD COLUMN meta_keywords varchar(255),
    ADD COLUMN meta_description varchar(255)"

    execute "ALTER TABLE problems 
    ADD COLUMN meta_title varchar(255),
    ADD COLUMN meta_keywords varchar(255),
    ADD COLUMN meta_description varchar(255)"


    execute "ALTER TABLE solutions 
    ADD COLUMN meta_title varchar(255),
    ADD COLUMN meta_keywords varchar(255),
    ADD COLUMN meta_description varchar(255)"


    execute "ALTER TABLE lessions 
    ADD COLUMN meta_title varchar(255),
    ADD COLUMN meta_keywords varchar(255),
    ADD COLUMN meta_description varchar(255)"


    execute "ALTER TABLE rubiests 
    ADD COLUMN meta_title varchar(255),
    ADD COLUMN meta_keywords varchar(255),
    ADD COLUMN meta_description varchar(255)"


    execute "ALTER TABLE studies 
    ADD COLUMN meta_title varchar(255),
    ADD COLUMN meta_keywords varchar(255),
    ADD COLUMN meta_description varchar(255)"
  end

  def down
    execute "ALTER TABLE topics 
    DROP COLUMN meta_title,
    DROP COLUMN meta_keywords,
    DROP COLUMN meta_description"

    execute "ALTER TABLE problems 
    DROP COLUMN meta_title,
    DROP COLUMN meta_keywords,
    DROP COLUMN meta_description"

    execute "ALTER TABLE solutions 
    DROP COLUMN meta_title,
    DROP COLUMN meta_keywords,
    DROP COLUMN meta_description"

    execute "ALTER TABLE lessions 
    DROP COLUMN meta_title,
    DROP COLUMN meta_keywords,
    DROP COLUMN meta_description"

    execute "ALTER TABLE rubiests 
    DROP COLUMN meta_title,
    DROP COLUMN meta_keywords,
    DROP COLUMN meta_description"

    execute "ALTER TABLE studies 
    DROP COLUMN meta_title,
    DROP COLUMN meta_keywords,
    DROP COLUMN meta_description"
  end
end
