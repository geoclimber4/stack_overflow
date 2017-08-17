get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

get 'questions/:id' do
  @question = Question.find(params[:id])
  erb :"questions/show"
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect '/questions'
  else
    @errors = @question.errors.full_messages
    erb :"questions/new"
  end
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect '/questions'
end
