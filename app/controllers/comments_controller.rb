class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "falgu", password: "falgu", only: :destroy
  def create
    params.permit!
    @article = Article.find(params[:article_id])
    # article = Article.new(article_params)
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
