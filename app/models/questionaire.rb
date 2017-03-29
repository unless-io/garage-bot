class Questionaire < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :evaluations
  has_many :treatment_processes

  validates :title, presence: true
  validates :instruction, presence: true
end
