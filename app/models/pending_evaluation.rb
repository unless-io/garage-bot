class PendingEvaluation < ApplicationRecord
  belongs_to :treatment_process
  belongs_to :user

  def self.generate
    Checkpoint.where(scheduled_day: Date.today).each do |checkpoint|
      PendingEvaluation.create(
        treatment_process: checkpoint.treatment_process, 
        user: checkpoint.treatment_process.client
        )
    end
  end

  def self.initiate_conversation
    PendingEvaluation.all.each do |pending_evaluation|
      InitiateConversationService.new(pending_evaluation: pending_evaluation).call
    end
  end
end
