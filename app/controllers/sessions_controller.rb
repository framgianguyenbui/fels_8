class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email params[:email]
    remember = params[:remember]
    if user && user.authenticate(params[:password])
      sign_in user,remember
      redirect_back_or user
    else
      flash[:error] = 'Invalid Email/Password combination'
      render 'sessions/new'
    end
  end

  def destroy
    sign_out
    redirect_to home_path
  end

  
end
