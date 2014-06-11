class SessionsController < ApplicationController
  before_action :return_home
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

  private
  def return_home
    redirect_back_or home_path if signed_in?
  end
end
