class Admin::SessionsController < ApplicationController
  def new
    redirect_to admin_home_path if current_user && current_user.adminaccess
  end

  def create
    user = User.find_by_email params[:email]
    remember = params[:remember]
    if user && user.authenticate(params[:password]) && user.adminaccess
      sign_in user,remember
      redirect_to admin_home_path
    else if user && !user.adminaccess
      flash[:error] = 'You do not have permission to login'
      else
        flash[:error] = 'Invalid Email/Password combination'
      end
      render 'admin/sessions/new'
    end
  end

  def destroy
    sign_out
    redirect_to admin_home_path
  end
end
