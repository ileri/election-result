class Admin::PartiesController < AdminController
  before_action :authenticate_user!
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.all
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(party_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to admin_parties_url, notice: 'Party was successfully created.' }
      else
        format.html { render :new }
      end
    end
    Rails.cache.clear
  end

  # PATCH/PUT /parties/1
  # PATCH/PUT /parties/1.json
  def update
    respond_to do |format|
      if @party.update(party_params)
        format.html { redirect_to admin_parties_url, notice: 'Party was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
    Rails.cache.clear
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to admin_parties_url, notice: 'Party was successfully destroyed.' }
    end
    Rails.cache.clear
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_params
      params.require(:party).permit(:name, :short_name, :logo, :alliance_id, :election_id, :order)
    end
end
