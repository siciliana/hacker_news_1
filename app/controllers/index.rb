get '/' do
  erb :index
end


get '/comments/:id' do
  @post = Post.find(params[:id])
  erb :comments
end 

get '/logout' do 
  session.clear
  redirect '/'
end

get '/create_post' do
  erb :create_post
end 

# =========POST===========
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

post '/create_post' do

  @url = Post.create(url: params[:url], user_id: session[:id])
  redirect '/'
end 

post '/create_comment/:post_id' do
  @comment = Comment.create(content: params[:content], post_id: params[:post_id], user_id: session[:id])
  redirect '/'
end