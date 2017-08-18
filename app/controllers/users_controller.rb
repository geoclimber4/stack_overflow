get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.create(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user= User.find(params[:id])
  erb :'users/show'
end
