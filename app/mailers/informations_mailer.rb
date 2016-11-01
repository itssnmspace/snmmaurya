class InformationsMailer < ApplicationMailer

  def problem_information_mailer_to_the_admin options={}
    @options = options
    mail(to: Settings.administrator_emails.informations, from: @options[:user].email, subject: @options[:subject], content_type: "text/html")
  end

  def problem_information_mailer_to_user options={}
    @options = options
    mail(to: @options[:user].email, from: Settings.administrator_emails.informations, subject: @options[:subject], content_type: "text/html")
  end

  def solution_information_mailer_to_the_admin options={}
    @options = options
    mail(to: Settings.administrator_emails.informations, from: @options[:user].email, subject: @options[:subject], content_type: "text/html")
  end

  def solution_information_mailer_to_user options={}
    @options = options
    mail(to: @options[:user].email, from: Settings.administrator_emails.informations, subject: @options[:subject], content_type: "text/html")
  end

  def information options={}
    @options = options
    mail(to: @options[:to], from: @options[:from], subject: @options[:subject], content_type: "text/html")
  end
end