class CheckpointCreationService
  def initialize(attributes)
    @treatment = attributes[:treatment]
  end

  def call
    duration_frequency_converter
  end

  private

  def duration_frequency_converter
    if @treatment.frequency == "daily"
      (@treatment.start_date..@treatment.end_date).each do |day|
        create_checkpoint(day)
      end
    elsif @treatment.frequency == "weekly"
      (@treatment.start_date..@treatment.end_date).step(7).each do |day|
        create_checkpoint(day)
      end
    end
  end

  def create_checkpoint(day)
    Checkpoint.create(treatment_process: @treatment, scheduled_day: day)
  end
end