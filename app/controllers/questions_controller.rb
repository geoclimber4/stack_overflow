get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

get '/questions/new' do
  authenticate!
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :"questions/show"
end

post '/questions' do
  authenticate!
  @question = Question.new(params[:question])
  # update current user method updon user merge
  @question.author_id = current_user.id
  if @question.save
    redirect '/questions'
  else
    @errors = @question.errors.full_messages
    erb :"questions/new"
  end
end

get  '/questions/:id/edit' do
  @question = Question.find(params[:id])
  if @question.author_id == current_user.id
    erb :'questions/edit'
  else
    redirect "/questions/#{@question.id}"
  end
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  if @question.author_id == current_user.id
    @question.assign_attributes(params[:question])
    if @question.save
      redirect '/questions'
    else
      @errors = @question.errors.full_messages
      erb ':questions/edit'
    end
  end
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  if @question.author_id == current_user.id
    @question.destroy
  # eventually delete all supporting answers, comments, votes
    redirect '/questions'
  else
    redirect "/questions/#{@question.id}"
  end
end


