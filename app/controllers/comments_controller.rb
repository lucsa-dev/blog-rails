class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  
  def create
    puts "comment_params: #{comment_params}"
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

end
