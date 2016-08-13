class InformationsMailer < ApplicationMailer

  def information options={}
    @options = options
    mail(to: @options[:to], from: @options[:from], subject: @options[:subject], content_type: "text/html")
  end
end