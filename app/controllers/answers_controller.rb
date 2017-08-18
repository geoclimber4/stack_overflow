# No show, it's shown in questions

get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

get '/questions/:question_id/answers' do

end

post '/questions/:question_id/answers' do

  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(text: params[:text])
  # update to current user after auth added!
  @answer.author_id = current_user.id

  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    erb :'answers/new'
  end
end

delete '/questions/:question_id/answers/:answer_id' do

  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:answer_id])

  @answer.destroy

  redirect '/questions/#{@question.id}/answers'

end
