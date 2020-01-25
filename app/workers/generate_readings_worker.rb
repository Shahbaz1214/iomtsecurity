class GenerateReadingsWorker
  include Sidekiq::Worker
  def perform(patient_id)
    @patient = Patient.find(patient_id)
    (1..5).each do |a|
      if @patient.id == 1
        value = rand(60..70)
      elsif @patient.id == 2
        value = rand(70..78)
      else
        value = rand(75..85)
      end
      sleep 3
      @patient.readings.create(reading_value: value)
    end
  end
end
