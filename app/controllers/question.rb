get '/questions' do
  @questions = Question.all
  erb :"homepage/index"
end
