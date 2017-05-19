get '/questions' do
  @questions = Question.all
  erb :"homepage/index"
end

get '/questions/new' do
	redirect '/' unless session[:user_id]
	erb :'questions/_question_form'
end

post '/questions' do
	@question = Question.new(title: params[:question][:title], body: params[:question][:body], questioner: current_user)

	if @question.save
    @vote = @question.votes.create(value: 1, voter: current_user)
		redirect "/questions/#{@question.id}"
	else
		status 403
	end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers.all
  @comments = @question.comments.all
  @question_votes = @question.votes.reduce(0) {|sum, vote| sum + vote.value}

  erb :'/questions/show'
end
