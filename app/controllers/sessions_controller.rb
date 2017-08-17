get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: param[:email])
  if @user.save
    erb :'/sessions/new'
  end
end
