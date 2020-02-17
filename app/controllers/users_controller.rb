class UsersController < ApplicationController
  before_action :ensure_correct_user,{only:[]}
  
  def new
    @user = User.new
    session[:user_id] = @user.id
  end 
  
  def index
  @users = User.all
   
  end
  
  def show
    @user = User.find_by(id: params[:id])
    
    
  end 
  


  
def create
  
end 
  
  def edit
    @user = User.find_by(id: params[:id])
  end 
  
  def update
    @user = User.find_by(id: params[:id])
    @user.username = params[:username]
    @user.update(user_params)
    @user.save
      redirect_to("/users/#{@user.id}")
  end 
  
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to("/worry/index")
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :image_name)
  end 
end
