class PagesController < ApplicationController

  def contact
    @contact = Contact.new
  end
  
  def create_contact
    @contact = Contact.new(contacts_params)
    if @contact.save
      flash[:success] = "Thanks for contact to me, will revert as soon as possible!"
    else
      flash[:error] = "Unable to process! #{@contact.errors.full_messages.join(', ')}"
    end
    redirect_to contact_path
  end

  def terms
  end

  def policies
  end

  #Render static pages
  #params[:page] has partial/erb file name
  #pages_path(page: "filename", layout: true/false)
  def pages
    if params[:page].present?
      render params[:page], layout: (params[:layout].present? ? params[:layout] : true)
    else
      flash[:error] = "You are trying to access wrong page/path!"
      redirect_to root_path
    end
  end

private
  def contacts_params
    params.require(:contact).permit(:name, :email, :contact, :message)
  end
end
