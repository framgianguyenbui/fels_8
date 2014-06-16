class Admin::SessionsController < ApplicationController
  before_filter :signed_in_admin
  layout 'admin/layouts/admin'

  def new

  end

  def create
    user = User.find_by_email params[:email]
    remember = params[:remember]
    if user && user.authenticate(params[:password]) && user.can_access_admin?
      sign_in user,remember
      redirect_to admin_home_path
    else if user && !user.can_access_admin?
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
