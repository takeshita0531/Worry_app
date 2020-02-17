class WorriesController < ApplicationController
    # 新規投稿
  def new
      @worry = Worry.new
  end 
    # 投稿一覧
  def index
      @worries = Worry.all.order(created_at: :desc)
  end
  
  # 編集、削除
  def show
    @worry=Worry.find_by(id: params[:id])
    @comments = @worry.comments
    @comment = Comment.new
  end
#   投稿保存
  def create
      @worry = Worry.new(content: params[:content])
      @worry.save
      redirect_to("/worry/index")
  end
  
  private
  
  def worry_params
    params.require(:worry).permit(:content, :image)
  end

end
