class PendingEvaluation < ApplicationRecord
  belongs_to :treatment_process
  belongs_to :user

  def self.generate_and_cleanup
    Checkpoint.where(scheduled_day: Date.today).each do |checkpoint|
      PendingEvaluation.where(treatment_process: checkpoint.treatment_process).destroy_all

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
