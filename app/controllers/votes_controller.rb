
post '/questions/:question_id/votes' do
  @question = Question.find(params[:question_id])
  @vote = @question.votes.new(value: params[:vote])

  if @vote.save
    redirect "/questions"
  else
    # this is to handle errors. There shouldn't be any errors ever though.....
    erb :"questions/index"
  end
end
