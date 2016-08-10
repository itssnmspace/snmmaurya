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
    redirect_to contact_pages_path
  end

private
  def contacts_params
    params.require(:contact).permit(:name, :email, :contact, :message)
  end
end
