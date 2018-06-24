class Admin::AlliancesController < AdminController
  before_action :authenticate_user!
  before_action :set_alliance, only: [:show, :edit, :update, :destroy]

  # GET /alliances
  # GET /alliances.json
  def index
    @alliances = Alliance.all
  end

  # GET /alliances/1
  # GET /alliances/1.json
  def show
  end

  # GET /alliances/new
  def new
    @alliance = Alliance.new
  end

  # GET /alliances/1/edit
  def edit
  end

  # POST /alliances
  # POST /alliances.json
  def create
    @alliance = Alliance.new(alliance_params)

    respond_to do |format|
      if @alliance.save
        format.html { redirect_to admin_alliances_url, notice: 'Alliance was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /alliances/1
  # PATCH/PUT /alliances/1.json
  def update
    respond_to do |format|
      if @alliance.update(alliance_params)
        format.html { redirect_to admin_alliances_url, notice: 'Alliance was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /alliances/1
  # DELETE /alliances/1.json
  def destroy
    @alliance.destroy
    respond_to do |format|
      format.html { redirect_to admin_alliances_url, notice: 'Alliance was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alliance
      @alliance = Alliance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alliance_params
      params.require(:alliance).permit(:election_id, :name)
    end
end
