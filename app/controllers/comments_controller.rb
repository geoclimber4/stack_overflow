# will be a partial
# to get to a form for comments on question
get '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id])
  
  if request.xhr?
    erb :"comments/_new_q_comment", layout: false
  else
  erb :"comments/new_question"
  end
end

post '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comment = @question.comments.new(author_id: current_user.id, text: params[:text])
  if @comment.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = @comment.errors.full_messages
    erb :"comments/new_question"
  end
  # @comment = Comment.create(author_id: current_user.id, text: params[:text], commentable_id: @question.id, commentable_type: :Question)
  # redirect "/questions/#{@question.id}"
end

get '/answers/:answer_id/comments/new' do
  # @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  erb :"comments/new_answer"
end

post '/answers/:answer_id/comments' do
  # @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  @comment = @answer.comments.new(author_id: current_user.id, text: params[:text])
  if @comment.save
    redirect "/questions/#{@answer.question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :"comments/new_answer"
  end
end

delete '/answers/:answer_id/comments/:id/delete' do
  @comment = Comment.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  @comment.destroy
  redirect "/questions/#{@answer.question_id}"
end

delete '/questions/:question_id/comments/:id/delete' do
  @comment = Comment.find(params[:id])
  # @answer = Answer.find(params[:answer_id])
  @comment.destroy
  redirect "/questions/#{params[:question_id]}"
end

