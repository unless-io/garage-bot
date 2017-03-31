Questionaire.destroy_all
Question.destroy_all
QuestionOption.destroy_all

#questionaire 1
quest1 = Questionaire.create!(title: "Top positive", instruction: "A questionaire to help clients point out 5 good activities in their life at the moment. By defining them, there will be an awareness of them and therefore will be the chance to have clients do these activities more.")
#open question
question1 = Question.create!(questionaire_id: quest1.id, category: "Open", content: "What is the most positive at this moment?")
#closed but scale
question2 = Question.create!(questionaire_id: quest1.id, category: "Scale", content: "How positive is this activity for you on a scale of 1 - 10?")
#multiple choice
question3 = Question.create!(questionaire_id: quest1.id, category: "Multiple Choice", content: "How often do you undertake this activity?")

questionoptions1 = QuestionOption.create!(question_id:question3.id, content: "Daily")
questionoptions2 = QuestionOption.create!(question_id:question3.id, content: "Once a week")
questionoptions3 = QuestionOption.create!(question_id:question3.id, content: "Once a month")
questionoptions4 = QuestionOption.create!(question_id:question3.id, content: "Less")

#multiple choice
question4 = Question.create!(questionaire_id: quest1.id, category: "Multiple Choice", content: "How often do you want to undertake this activity?")
questionoptions5 = QuestionOption.create!(question_id:question4.id, content: "Daily")
questionoptions6 = QuestionOption.create!(question_id:question4.id, content: "Once a week")
questionoptions7 = QuestionOption.create!(question_id:question4.id, content: "Once a month")
questionoptions8 = QuestionOption.create!(question_id:question4.id, content: "Less")

#closed but scale
question5 = Question.create!(questionaire_id: quest1.id, category: "Scale", content: "How happy are you with the frequency of this activity for you on a scale of 1 - 10?")
#open question
question6 = Question.create!(questionaire_id: quest1.id, category: "Open", content: "What could be a first good step to undertake this?")


######
quest2 = Questionaire.create!(title: "Top problems", instruction: "A questionaire to help clients point out the biggest problems they have at the moment. This will give a therapist the chance to map out the problems to work on first.")
#open question
question7 = Question.create!(questionaire_id: quest2.id, category: "Open", content: "What is the biggest problem you have at the moment?")
#closed but scale
question8 = Question.create!(questionaire_id: quest2.id, category: "Scale", content: "How serious is this problem on a scale of 1-10?")
#open question
question9 = Question.create!(questionaire_id: quest2.id, category: "Open", content: "What is the biggest problem after the previous one?")
#closed but scale
question10 = Question.create!(questionaire_id: quest2.id, category: "Scale", content: "How serious is this problem on a scale of 1-10?")
#open question
question11 = Question.create!(questionaire_id: quest2.id, category: "Open", content: "What is the biggest problem after the previous one?")
#closed but scale
question12 = Question.create!(questionaire_id: quest2.id, category: "Scale", content: "How serious is this problem on a scale of 1-10?")
