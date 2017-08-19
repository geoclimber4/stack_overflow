get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

get '/questions/new' do
  authenticate!
  if request.xhr?
    erb :'questions/new', layout: false
  else
    erb :'questions/new'
  end
end

get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  @answers = @question.answers
  erb :"questions/show"
end

post '/questions' do
  authenticate!
  @question = Question.new(params[:question])
  # update current user method updon user merge
  @question.author_id = current_user.id
  if request.xhr?
    if @question.save
      erb :"questions/_new_idk", layout: false, locals: {question: @question}
    end
  else
    if @question.save
      redirect '/questions'
    else
      @errors = @question.errors.full_messages
      erb :"questions/new"
    end
  end
end

# <<<<<<< HEAD
# get  '/questions/:question_id/edit' do
#   @question = Question.find(params[:question_id])
#   erb :'questions/edit'
# end

# put '/questions/:question_id' do
#   @question = Question.find(params[:question_id])
#   p params
#   p params[:question]
#   @question.assign_attributes(params[:question])
#   if @question.save
#     redirect '/questions'
#   else
#     @errors = @question.errors.full_messages
#     erb ':questions/edit'
#   end
# end

# delete '/questions/:question_id' do
#   @question = Question.find(params[:question_id])
#   @question.destroy
# =======
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
  p params
  if @question.author_id == current_user.id
    # @question.assign_attributes(params[:question])
    @question.best_answer_id = params[:answer_id]

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



