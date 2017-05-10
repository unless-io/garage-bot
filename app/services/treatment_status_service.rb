class TreatmentStatusService
  def initialize(attributes)
    @treatment = attributes[:treatment]
  end

  def call
    check_ending
  end

  def check_ending
    if @treatment.duration.nil? || @treatment.frequency.nil?
      "Information incomplete, please fill out all fields"
    else
      if Date.today > end_date
        @treatment.status = "Ended"
        @treatment.save
        "Process ended"
      elsif Date.today < @treatment.start_date
        @treatment.status = "Pending"
        @treatment.save
        "Process not yet started"
      else
        @treatment.status = "Ongoing"
        @treatment.save
        "Process ongoing"
      end
    end
  end

  def end_date
    duration_conversion = {
      "one week": 1.week,
      "two weeks": 2.weeks,
      "one month": 1.month,
      "three months": 2.months
    }
    end_date = @treatment.start_date + duration_conversion[@treatment.duration.to_sym]
  end
end