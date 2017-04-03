class PendingEvaluation < ApplicationRecord
  belongs_to :questionaire
  belongs_to :user
end
