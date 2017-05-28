class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :treatment_process
  has_many :answers, dependent: :destroy
  has_many :questions, through: :questionaire
end
