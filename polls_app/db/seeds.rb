# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


frogman = User.create!(username: 'frogman')
dog = User.create!(username: 'dog')
cat = User.create!(username: 'cat')
rabbit = User.create!(username: 'rabbit')
hamster = User.create!(username: 'hamster')

Water = Poll.create!(title: "Water Referendum" , user_id: 1)
Fire = Poll.create!(title: "Fire Referendum" , user_id: 1)
Wind = Poll.create!(title: "Wind Referendum" , user_id: 2)
Earth = Poll.create!(title: "Earth Referendum" , user_id: 3)

question1 = Question.create!(text: "Do you agree that water is good?", poll_id: 1)
question2 = Question.create!(text: "Do you agree that we should have lots of water?", poll_id: 1)
question3 = Question.create!(text: "Fire is fun right?", poll_id: 2)
question4 = Question.create!(text: "Is your umbrella wind proof?", poll_id: 3)


answer_choices1 = AnswerChoice.create!(text: "yes", question_id: 1)
answer_choices2 = AnswerChoice.create!(text: "no", question_id: 1)
answer_choices3 = AnswerChoice.create!(text: "yes", question_id: 2)
answer_choices4 = AnswerChoice.create!(text: "no", question_id: 2)
answer_choices5 = AnswerChoice.create!(text: "yes it the best", question_id: 3)
answer_choices6 = AnswerChoice.create!(text: "no", question_id: 4) 

response1 = Response.create!(user_id: 1, answer_choice_id: 1)
response2 = Response.create!(user_id: 1, answer_choice_id: 4)
response3 = Response.create!(user_id: 1, answer_choice_id: 6)
response4 = Response.create!(user_id: 2, answer_choice_id: 2)
response4 = Response.create!(user_id: 2, answer_choice_id: 3)
response4 = Response.create!(user_id: 2, answer_choice_id: 5)
response4 = Response.create!(user_id: 3, answer_choice_id: 1)
response4 = Response.create!(user_id: 3, answer_choice_id: 3)
response4 = Response.create!(user_id: 4, answer_choice_id: 2)
response4 = Response.create!(user_id: 4, answer_choice_id: 6)



