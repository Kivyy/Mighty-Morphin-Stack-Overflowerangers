post '/comments' do
  question = Question.find(params["question"].to_i)
  # binding.pry
  if !!params[:answers]
    answer = Answer.find(params["answers"].to_i)
    answer.comments.create( body: params["body"], commenter: current_user)
  else
    question.comments.create( body: params["body"], commenter: current_user)
    question.votes.create(value: 1, voter: current_user)
  end
  redirect "/questions/#{question.id}"
end
