get '/question' do
  @questions = Question.all
  erb :"homepage/index"
end
