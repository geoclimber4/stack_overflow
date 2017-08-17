get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:user][:email])
  p params
  if @user && @user.authenticate(params[:user][:password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :'/sessions/new'
  end
end

delete '/sessions/delete' do
  session[:id] = nil
  redirect '/questions'
end
