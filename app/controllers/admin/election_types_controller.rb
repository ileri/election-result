class Admin::ElectionTypesController < AdminController
  before_action :set_election_type, only: [:show, :edit, :update, :destroy]

  # GET /election_types
  # GET /election_types.json
  def index
    @election_types = ElectionType.all
  end

  # GET /election_types/1
  # GET /election_types/1.json
  def show
  end

  # GET /election_types/new
  def new
    @election_type = ElectionType.new
  end

  # GET /election_types/1/edit
  def edit
  end

  # POST /election_types
  # POST /election_types.json
  def create
    @election_type = ElectionType.new(election_type_params)

    respond_to do |format|
      if @election_type.save
        format.html { redirect_to admin_election_types_path, notice: 'Election type was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /election_types/1
  # PATCH/PUT /election_types/1.json
  def update
    respond_to do |format|
      if @election_type.update(election_type_params)
        format.html { redirect_to admin_election_types_path, notice: 'Election type was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /election_types/1
  # DELETE /election_types/1.json
  def destroy
    @election_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_election_types_url, notice: 'Election type was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election_type
      @election_type = ElectionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def election_type_params
      params.require(:election_type).permit(:name, :option)
    end
end
