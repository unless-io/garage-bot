class Question < ApplicationRecord
  belongs_to :questionaire
  validates :category, inclusion: { in: ["Yes/No" "Multiple choice" "Open", "Scale"] }
end
