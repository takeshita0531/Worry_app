class WorryController < ApplicationController
  before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}
  
    # 新規投稿
  def new
      @worry = Worry.new
      
  end 
    # 投稿一覧
  def index
      @worries = Worry.all.order(created_at: :desc)
      @worry = Worry.find_by(id: params[:id])


  end
  def users
    
  end
  def show
    @worry = Worry.find_by(id: params[:id])
    @user = @worry.user
    @comment = Comment.new
    @comments = @worry.comments
  end
#   投稿保存
  def create
    
      #@worry = Worry.new(content: params[:content]) <ではなく下のように書きます
      
    
      @worry = Worry.new(worry_params)
      @worry.user_id = current_user.id
      @worry.save
      redirect_to("/worry/index")
  end
  def edit
    @worry = Worry.find_by(id: params[:id])
  end 
  # 編集、削除
  def update
    @worry = Worry.find_by(id: params[:id])
    @worry.content = params[:content]
    @worry.save
    redirect_to("/worry/index")
  end 
  
  def destroy
    @worry = Worry.find_by(id: params[:id])
    @worry.destroy
    redirect_to("/worry/index")
  end 
  
  def ensure_correct_user
    @worry = Worry.find_by(id: params[:id])
    if @worry.user_id != current_user.id
      redirect_to("/worry/index")
    end 
  end
  
  private
  
  def worry_params
    params.require(:worry).permit(:content, :image, :user_id)
  end
  
end
