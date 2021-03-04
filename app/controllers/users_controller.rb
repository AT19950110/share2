class UsersController < ApplicationController
  
  before_action:authenticate_user,{only:[:edit,:show,:update]}
  before_action:forbid_login_user,{only:[:new,:create,:login_form,:login]}
  before_action :ensure_correct_user, {only: [:edit, :update,:show,:destroy]}
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password],
    repassword: params[:repassword],
    self_introduction: params[:self_introduction],
    user_image: "default_user_img.png"
    )
    unless @user.password == @user.repassword
    flash[:notice] = "入力されたパスワードが一致しません"
    render ("users/new")
    return
    end
      if params[:user_image]
       @user.user_image = "#{@user.id}.jpg"
       user_image = params[:user_image]
       File.binwrite("public/users_img/#{@user.user_image}",user_image.read)
      end
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "登録完了しました"
      redirect_to("/users/#{@user.id}")
    else
      flash[:notice] = @user.errors.full_messages.join("\n")
      render("users/new")
    end
  end
    
  def show
    @user = User.find_by(id: params[:id])
  end
    
  def edit
     @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.self_introduction = params[:self_introduction]
    if params[:user_image]
       @user.user_image = "#{@user.id}.jpg"
       user_image = params[:user_image]
       File.binwrite("public/users_img/#{@user.user_image}",user_image.read)
    end
     if @user.save
      flash[:notice] = "変更しました"
      redirect_to("/users/#{@user.id}")
     else
        flash[:notice] = @user.errors.full_messages.join("\n")
      render("users/edit")
     end
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました" 
      redirect_to("/")
    else
      @error_message = "メールアドレスとパスワードが一致しません"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      flash[:notice] = "アカウントを削除しました"
      redirect_to("/")
    end
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
   flash[:notice] = "権限がありません"
   redirect_to("/users/#{@current_user.id}")
    end
  end
  
  
end
