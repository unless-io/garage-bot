class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :questionaire
  has_many :answers
  has_many :questions, through: :questionaire
end
