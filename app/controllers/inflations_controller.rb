class InflationsController < ProtectedController
  before_action :set_inflation, only: [:show, :edit, :update, :destroy]

  # GET /inflations
  # GET /inflations.json
  def index
    @inflations = Inflation.all
  end

  # GET /inflations/1
  # GET /inflations/1.json
  def show

  end

  # GET /inflations/new
  def new
	@country = Country.find(params[:country_id])
    @inflation = Inflation.new
  end

  # GET /inflations/1/edit
  def edit
  end

  # POST /inflations
  # POST /inflations.json
  def create
	  puts "-------------------set_inflation DEBUG1--------------------"
	  puts params
	  puts "-------------------set_inflation DEBUG2--------------------"
	  puts inflation_params
	  puts "-------------------set_inflation DEBUG3--------------------"

	@country = Country.find(params[:country_id])
    @inflation = Inflation.new(inflation_params)
	@inflation.country_id = @country.id

    respond_to do |format|
      if @inflation.save
        format.html { redirect_to country_inflations_path(@country), notice: 'Inflation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @inflation }
      else
        format.html { render action: 'new' }
        format.json { render json: @inflation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inflations/1
  # PATCH/PUT /inflations/1.json
  def update

    respond_to do |format|
      if @inflation.update(inflation_params)
        format.html { redirect_to country_inflations_path(@country), notice: 'Inflation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @inflation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inflations/1
  # DELETE /inflations/1.json
  def destroy
    @inflation.destroy
    respond_to do |format|
      format.html { redirect_to inflations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inflation
	  @country = Country.find(params[:country_id])
	  puts "Country : " + @country.name
      @inflation = Inflation.find(params[:id])
	  puts "Inflation Year : " + @inflation.year.to_s
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inflation_params
		puts "-------------------inflation_params DEBUG1--------------------"
		puts params
      params.require(:inflation).permit(:country_id, :year, :inflation)
    end
end
