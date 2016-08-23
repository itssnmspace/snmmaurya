class ChronMailer < ApplicationMailer

  def information options={}
    mail(to: "snmspace@gmail.com", from: "snmmaurya@gmail.com", subject: "SnmMaurya Chron Information", content_type: "text/html")
  end
end