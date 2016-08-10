class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_master_profile

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :error => exception.message
  end

  def set_master_profile
    @user = User.find_by(role_id: 1)
    @user_profile = @user.profiles.try(:last)
  end

  # def set_origin
  #   binding.pry
  #   if signin_request?
  #     session[:origin] = request.referer
  #   end 
  # end

  # def signin_request?
  #   request.original_url.include?("sign_in") || request.original_url.include?("signin") 
  # end
end