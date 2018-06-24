class Admin::HomeController < AdminController
  before_action :active_elections
  def index
    @boxes = Box.all
  end

  private
  def active_elections
    @active_elections = Election.where(active: true)
  end
end
