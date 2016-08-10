class AddResumeDocResumePdfToUsers < ActiveRecord::Migration[5.0]
  def change
    add_attachment :users, :resume_doc unless column_exists? :users, :resume_doc
    add_attachment :users, :resume_pdf unless column_exists? :users, :resume_pdf
  end
end