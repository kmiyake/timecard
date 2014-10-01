class DashboardsController < ApplicationController
  before_action :redirect_to_root

  def show
  end

  private

  def redirect_to_root
    redirect_to root_url unless user_signed_in?
  end
end
