class Questionaire < ApplicationRecord
  has_many :questions
  has_many :evaluations
  has_many :treatment_processes
end
