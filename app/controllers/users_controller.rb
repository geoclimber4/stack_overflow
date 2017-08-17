get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.create(params[:user])
  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_message
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user= User.find(params[:id])
  erb :'users/show'
end
