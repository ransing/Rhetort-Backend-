
require 'rest-client'
require 'json'

Question.destroy_all
Answer.destroy_all
# User.destroy_all

ques = RestClient.get("https://cah-gcs-api.herokuapp.com/api/v1/pack/fourth_expansion")
ques_array = JSON.parse(ques)



# ques_array["blackCards"].each do |question|
# Question.create(question: question["text"], category: "General")
# rm = RestClient.get('https://rickandmortyapi.com/api/character/')
# rm_array = JSON.parse(rm)["results"]

ques_array["black"].each do |x|
    Question.create(
        question: x["content"], category: x["pick"].to_s
        )
    end 
    
    # a1 = Answer.create(answer: "answers to the code challenge", question_id:54, user_id:1)
    # a2 = Answer.create(answer: "cocaine", question_id:58, user_id:1)
    
answ = RestClient.get("https://cah-gcs-api.herokuapp.com/api/v1/pack/fourth_expansion")
answ_array = JSON.parse(answ)
                
answ_array["white"].each do |x|
    Answer.create(
        answer: x, question_id: rand(145..154), user_id: rand(1..9), like: 0
    )
    end 

puts "seed"