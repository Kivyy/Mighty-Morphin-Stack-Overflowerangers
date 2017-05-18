get '/questions/new' do 
	redirect '/' unless session[:user_id]
	erb :'questions/_question_form'
end

post '/questions/:id' do 
	@question = Question.new(title: params[:title], body: [params[:body]], questioner: current_user.id)

	if @question.save
		redirect '/questions/:question_id'
	else
		status 403
	end
end

get '/questions/:id' do
	"you did it!"
end