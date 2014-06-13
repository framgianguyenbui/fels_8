class Admin::AdminController < ApplicationController
  protect_from_forgery with: :exception
  include Admin::SessionsHelper
  layout 'admin/layouts/admin'

  before_action :signed_in_user
end
