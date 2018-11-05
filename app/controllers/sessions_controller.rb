class SessionsController < ApplicationController
  def new
 end

 def verify

 end

 def create
   repairman = Repairman.find_or_create_by(uid: auth['uid']) do |u|
     u.name = auth['info']['name']
     u.email = auth['info']['email']

     u.password = "password"
   end
   sign_in(repairman)
   session[:repairman_id] = repairman.id
   redirect_to repairman_path(repairman)
 end

 def destroy
   session.destroy
   redirect_to '/'
 end

private

 def auth
   request.env['omniauth.auth']
 end


end
