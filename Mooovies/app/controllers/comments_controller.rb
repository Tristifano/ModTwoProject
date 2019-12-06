class CommentsController < ApplicationController

    def new
        @review = Review.find(params[:review])
        @comment = Comment.new
    end

    def create
        @review = Review.find(params[:review_id])
        @comment = Comment.create(content: params[:content], user: @review.user, review: @review)
        @comments = @review.comments

        redirect_to comment_path(:review => @review.id)
    end

    private
    
    def comment_params
        params.require(:comment).permit(:content)
    end
end
