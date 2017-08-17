get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

get '/questions/new' do

  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :"questions/show"
end

post '/questions' do

  @question = Question.new(params[:question])
  # update current user method updon user merge
  @question.author_id = 2
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
