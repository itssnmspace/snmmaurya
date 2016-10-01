class SolutionsMailer < ApplicationMailer

  def problem_information
    @options = options
    mail(to: @options[:user].email, from: Settings.administrator_emails.informations, subject: @options[:subject], content_type: "text/html")
  end

  def solution_information options={}
    @options = options
    mail(to: @options[:user].email, from: Settings.administrator_emails.informations, subject: @options[:subject], content_type: "text/html")
  end
end