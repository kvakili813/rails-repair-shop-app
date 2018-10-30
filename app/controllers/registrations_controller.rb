class RegistrationsController < ApplicationController
  private

 def sign_up_params
   params.require(:repairman).permit(:name, :email, :password, :password_confirmation)
 end

 def account_update_params
   params.require(:repairman).permit(:name, :email, :password, :password_confirmation, :current_password)
 end
end
