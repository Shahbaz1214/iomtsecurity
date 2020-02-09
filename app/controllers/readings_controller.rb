class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy]
  before_action :set_patient
  before_action :authenticate_user!
  # GET /readings
  def index
    @readings = @patient.readings.all.order('created_at asc')
  end

  # GET /readings/1
  def show
  end

  # GET /readings/new
  def new
    @reading = @patient.readings.new
  end

  # GET /readings/1/edit
  def edit
  end

  # POST /readings
  def create
    @reading = @patient.readings.new(reading_params)

    if @reading.save
      redirect_to patient_readings_path(@patient), notice: 'Reading was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /readings/1
  def update
    if @reading.update(reading_params)
      redirect_to patient_readings_path(@patient), notice: 'Reading was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /readings/1
  def destroy
    @reading.destroy
    redirect_to readings_url, notice: 'Reading was successfully destroyed.'
  end

  def verify
    @patient.readings.each do |reading|
      blockchain_hash = Block.first("#{reading.reading_value}-#{reading.created_at}").transactions_hash
      if blockchain_hash != reading.blockchain_hash
        reading.update_column(:verification_status, 2)
      else
        reading.update_column(:verification_status, 1)
      end
    end
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

  def temper
    @patient.readings.last(2).each do |reading|
      reading.update_column(:reading_value, reading.reading_value.to_i + 1)
    end
    @patient.readings.each do |reading|
      blockchain_hash = Block.first("#{reading.reading_value}-#{reading.created_at}").transactions_hash
      if blockchain_hash != reading.blockchain_hash
        reading.update_column(:verification_status, 2)
      else
        reading.update_column(:verification_status, 1)
      end
    end
    respond_to do |format|
      format.html { redirect_to patient_readings_path(@patient) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reading_params
      params.require(:reading).permit(:reading_value)
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end
end
