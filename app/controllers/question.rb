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
		redirect "/questions/#{@question.id}"
	else
		status 403
	end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end
