get '/' do
  erb :index
end


get '/vote/:postid' do
  @unicorn = Unicorn.find_or_create_by_post_id(params[:postid])
  @unicorn.post_id = params[:postid]
  @unicorn.post_vote += 1
  @unicorn.user_id = session[:id]
  @unicorn.save
  
  if request.xhr? 
    erb :somewhere
  else 
    erb :index
  end 

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

get '/profile/:id' do
  @user = User.find(params[:id])
  @user_posts = @user.posts
  @user_comments = @user.comments
  erb :user_profile
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

post '/signup' do
  if params[:password] == params[:confirm_password]
    @new_user = User.create(username: params[:username], password: params[:password])
    session[:id] = @new_user.id
    erb :index 
  else 
    @mismatch = "password and confirm password do not match"
    erb :index
  end 
  
end 

post '/vote/:postid' do
  @unicorn = Unicorn.find_or_create_by_post_id(params[:postid])
  @unicorn.post_id = params[:postid]
  @unicorn.post_vote += 1
  @unicorn.user_id = session[:id]
  @unicorn.save
  
  if request.xhr? 
    content_type(:json)
    {post_vote: @unicorn.post_vote}.to_json
  else 
    erb :index
  end 

end 