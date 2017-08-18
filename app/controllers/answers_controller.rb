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
    if request.xhr?
      erb :"answers/show", locals: { answer: @answer}, layout: false
    else
      redirect "/questions/#{@question.id}"
    end
  else
    if request.xhr?
      status 422
      { errors: @answer.errors.full_messages }.to_json
    else
      @errors = @answers.errors.full_messages
      erb :'answers/new'
    end
  end
end

delete '/questions/:question_id/answers/:answer_id' do

  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:answer_id])

  @answer.destroy

  redirect '/questions/#{@question.id}/answers'

end
