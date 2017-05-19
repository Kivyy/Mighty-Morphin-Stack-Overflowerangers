def current_user
  User.find_by(id: session[:user_id])
end

def logged_in?
  !! session[:user_id]
end

def vote_calculator(votable)
  votable.votes.reduce(0) {|sum, vote| sum + vote.value}
end
