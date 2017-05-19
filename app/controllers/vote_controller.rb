post '/votes' do
  if logged_in?
    if params[:question]
      question = Question.find(params["question"].to_i)
      new_vote = question.votes.new(value: params["value"].to_i, voter_id: current_user.id)
      new_voter = new_vote.voter
      old_vote = Vote.find_by(voter: new_voter, voteable_type: new_vote.voteable_type)

      if old_vote
        old_vote.destroy
      end
      new_vote.save
    elsif params[:comment]
      comment = Comment.find(params["comment"].to_i)
      question = Question.find(comment.commentable_id)
      new_vote = comment.votes.new(value: params["value"].to_i, voter_id: current_user.id)
      new_voter = new_vote.voter
      old_vote = Vote.find_by(voter: new_voter, voteable_type: new_vote.voteable_type, voteable_id: new_vote.voteable_id)

      if old_vote
        old_vote.destroy
      end
      new_vote.save
    elsif params[:answer]
      answer = Answer.find(params["answer"].to_i)
      question = answer.question
      new_vote = answer.votes.new(value: params["value"].to_i, voter_id: current_user.id)
      new_voter = new_vote.voter
      old_vote = Vote.find_by(voter: new_voter, voteable_type: new_vote.voteable_type, voteable_id: new_vote.voteable_id)

      if old_vote
        old_vote.destroy
      end
      new_vote.save
    end

  else
    redirect '/login'
  end
  redirect "/questions/#{question.id}"
end
