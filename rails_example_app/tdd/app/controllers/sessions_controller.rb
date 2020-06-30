class SessionsController < ApplicationController
  def create
    # fail
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to players_path
    else
      flash[:errors] = ["Invalid Combination"]
      # redirect_to :back
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end
end
