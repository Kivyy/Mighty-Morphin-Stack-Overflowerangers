post '/answers' do
  question = Question.find(params["question"].to_i)

  question.answers.create(response: params["response"], answerer: current_user)
  redirect "/questions/#{question.id}"
end
