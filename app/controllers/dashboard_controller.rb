class DashboardController < ApplicationController
  def index
    @klasses = current_user.klasses
  end
end
