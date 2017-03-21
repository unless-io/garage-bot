class TreatmentProcess < ApplicationRecord
  belongs_to :questionaire
  belongs_to :client, class_name: "User"
  belongs_to :creator, class_name: "User"
  has_many :evaluations, through: :questionaire
end
