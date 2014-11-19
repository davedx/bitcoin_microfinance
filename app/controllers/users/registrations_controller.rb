class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

  def create
    super
  end

  def new
    super
  end

  def edit
    super
  end

  private
 
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:name, :address, :city, :country, :mobile, :facebook_url, :about, :email, :password, :password_confirmation, :current_password)
  end

end
