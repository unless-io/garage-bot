class PendingEvaluation < ApplicationRecord
  belongs_to :pending_questionaire, class_name: "Questionaire"
  belongs_to :user
end
