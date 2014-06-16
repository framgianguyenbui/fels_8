class Admin::StaticPagesController < ApplicationController
  before_filter :signed_in_admin
  layout 'admin/layouts/admin'

end
