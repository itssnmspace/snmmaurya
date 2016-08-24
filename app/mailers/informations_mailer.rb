class InformationsMailer < ApplicationMailer

  def information options={}
    @options = options
    mail(to: @options[:to], from: @options[:from], subject: @options[:subject], content_type: "text/html")
  end

  def problem options={}
    @options = options
    mail(to: Settings.administrator_emails.informations, from: @options[:user].email, subject: @options[:subject], content_type: "text/html")
  end
end