class SessionsController < ApplicationController

  def create
   # user = User.from_omniauth(env['omniauth.auth'])
   auth  = request.env["omniauth.auth"]
   user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_from_omniauth(auth)
   session[:user_id] = user.id
   redirect_to root_url, notice: "Signed in."
   # session[:username] = user.anonymizer
  end

  def destroy
  session[:user_id] = nil
  redirect_to root_url, notice: "Signed out."
  end

  def invalid
    session[:user_id] = nil
    redirect_to root_url, notice: "Authentication failed, please try again."
  end
end
