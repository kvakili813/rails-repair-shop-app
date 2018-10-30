class SessionsController < ApplicationController
  def new
 end

 def verify

 end

 def create
   repairman = Repairman.find_or_create_by(uid: auth['uid']) do |u|
     u.name = auth['info']['name']
     u.email = auth['info']['email']

     # this is horrible, but pw can't be blank, eventually make prompt to immedidately set new pw
     u.password = "password"
   end
   sign_in(repairman)
   session[:repairman_id] = repairman.id
   redirect_to repairman_path(repairman)
 end

 def auth
   request.env['omniauth.auth']
 end

 def destroy
   session.destroy
   redirect_to '/'
 end
end
