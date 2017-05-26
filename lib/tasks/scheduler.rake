desc "This task is called by the Heroku scheduler add-on"
task :update_pending_evaluations => :environment do
  PendingEvaluation.generate
  PendingEvaluation.initiate_conversation
end
