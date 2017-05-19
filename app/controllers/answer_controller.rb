post '/answers' do
  question = Question.find(params["question"].to_i)
  @answer = question.answers.new(response: params["response"], answerer: current_user)

  if @answer.save
    @vote = @answer.votes.create(value: 1, voter: current_user)
    redirect "/questions/#{question.id}"
  else
    status 403
  end

  redirect "/questions/#{question.id}"
end
