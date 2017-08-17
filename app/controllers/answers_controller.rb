# No show, it's shown in questions

get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do

  p params
  p params[:text]
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(text: params[:text])
  @answer.author_id = 1

  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    erb :'answers/new'
  end

end
