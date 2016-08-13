class Contact < ApplicationRecord
  validates :name, :email, :contact, :message, presence: true
  validates :contact, length: {minimum: 10, maximum: 13}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  after_save :send_information_email

  def send_information_email
    InformationsMailer.information(
    {
      name: self.name,
      email: self.email,
      contact: self.contact,
      message: self.message,
      from: self.email,
      subject: "Snmmaurya: Contact Request",
      to: Settings.administrator_emails.informations
    }).deliver_now
  end
end