get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

get '/questions/new' do

  erb :'questions/new'
end

get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
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

get  '/questions/:question_id/edit' do
  @question = Question.find(params[:question_id])
  erb :'questions/edit'
end

put '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  p params
  p params[:question]
  @question.assign_attributes(params[:question])
  if @question.save
    redirect '/questions'
  else
    @errors = @question.errors.full_messages
    erb ':questions/edit'
  end
end

delete '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  @question.destroy
  # eventually delete all supporting answers, comments, votes
  redirect '/questions'
end


