class SimulatorsController < ApplicationController
  before_action :set_simulator, only: [:show, :edit, :update, :destroy]
  before_action :set_patient
  before_action :authenticate_user!
  # GET /simulators
  def index
    @simulators = Simulator.all
  end

  # GET /simulators/1
  def show
  end

  # GET /simulators/new
  def new
    GenerateReadingsWorker.perform_async(@patient.id)
    redirect_to patient_readings_path(@patient)
  end

  # GET /simulators/1/edit
  def edit
  end

  # POST /simulators
  def create
    @simulator = Simulator.new(simulator_params)

    if @simulator.save
      redirect_to @simulator, notice: 'Simulator was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /simulators/1
  def update
    if @simulator.update(simulator_params)
      redirect_to @simulator, notice: 'Simulator was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /simulators/1
  def destroy
    @simulator.destroy
    redirect_to simulators_url, notice: 'Simulator was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simulator
      @simulator = Simulator.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def simulator_params
      params.require(:simulator).permit(:patient_id)
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end
end
