class TreatmentProcess < ApplicationRecord
  belongs_to :questionaire
  belongs_to :client, class_name: "User"
  belongs_to :creator, class_name: "User"
  has_many :evaluations, through: :questionaire
  after_create :set_status

  private

  def set_status
    TreatmentStatusService.new(treatment: self).call
  end
end
