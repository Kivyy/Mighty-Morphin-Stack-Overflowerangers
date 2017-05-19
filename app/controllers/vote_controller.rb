post '/votes' do
  question = Question.find(params["question"].to_i)
  # binding.pry
  if logged_in?
    new_vote = question.votes.new(value: params["value"].to_i, voter_id: current_user.id)
    new_voter = new_vote.voter
    old_vote = Vote.find_by(voter: new_voter, voteable_type: new_vote.voteable_type)

    if old_vote
      old_vote.destroy
    end
    new_vote.save
  else
    redirect '/login'
  end
  redirect "/questions/#{question.id}"
end
