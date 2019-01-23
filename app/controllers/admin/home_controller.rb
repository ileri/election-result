class Admin::HomeController < AdminController
  before_action :get_active_inactive_elections
  def index
    @boxes = Box.all
  end

  private
  def get_active_inactive_elections
    @active_elections = Election.where(active: true)
    @inactive_elections = Election.where(active: false)
  end
end
