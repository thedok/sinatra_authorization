get '/' do
 	@users = User.all if current_user
 	@user = 'nothing to display'
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
  	session[:id] = @user.id
  	redirect to '/'
  else
  	erb :sign_in
  end
end

delete '/sessions/:id' do
	session.clear
	redirect to '/'
end

#----------- USERS -----------

get '/users/new' do
  
  erb :sign_up
end

post '/users' do
	@user = User.new(params[:user])
	p params[:user][:password]
  @user.password = params[:user][:password]
  @user.save!
  redirect to '/'
end
