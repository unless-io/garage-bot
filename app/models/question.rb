class Question < ApplicationRecord
  belongs_to :questionaire

  has_many :question_options, inverse_of: :question
  accepts_nested_attributes_for :question_options, reject_if: :all_blank, allow_destroy: true

  validates :category, inclusion: { in: ["Yes/No", "Multiple choice", "Open", "Scale"] }
  validates :content, presence: true
end
