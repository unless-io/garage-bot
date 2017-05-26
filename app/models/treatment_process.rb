class TreatmentProcess < ApplicationRecord
  belongs_to :questionaire
  belongs_to :client, class_name: "User"
  belongs_to :creator, class_name: "User"
  has_many :evaluations
  after_create :set_status
  has_many :checkpoints

  def end_date
    TreatmentStatusService.new(treatment: self).end_date
  end

  private

  def set_status
    TreatmentStatusService.new(treatment: self).call
  end
end
