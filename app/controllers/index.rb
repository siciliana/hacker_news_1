get '/' do
  erb :index
end


get '/comments/:id' do
  @post = Post.find(params[:id])
  erb :comments
end 

get '/logout' do 
  session[:id].destroy
  end
  erb :index
end

get '/create_post' do
  erb :create_post
end 

post '/login' do 
  @user = User.find_by_username(params[:username])
  if @user 
    if @user.password == params[:password]
      session[:id] = @user.id
      erb :index
    else  
      @notpass = 'Either your usernamd or password is wrong' 
      redirect '/'
    end 
  else
    @notpass = 'Either your usernamd or password is wrong'
    erb :index
  end 
end


# post '/create_post/:user_id' do
#   @url = Post.create(params[:url], params[:user_id])
#   erb :
# end 