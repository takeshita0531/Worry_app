class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to("/worry/#{@comment.worry_id}")
        else
            redirect_to root_path
        end 
    end 
    
    def destroy
        @comment = Comment.find_by(id: params[:id])
        @comment.destroy
        redirect_to("/worry/#{@comment.worry_id}")
    end 
    
    private
    
    def comment_params
     params.permit(:content, :worry_id)
     
    end
end 
