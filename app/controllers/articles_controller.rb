class ArticlesController < ApplicationController
#http_basic_authenticate_with name: "falgu", password: "falgu", except: [:index, :show]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    params.permit!
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    # article = Article.new(article_params)
    if @article.save
       redirect_to @article , {:notice => 'Your Article saved Succesfully' }
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article , :notice => 'Your Article updated Succesfully'
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, :notice => 'Your Article deleted Succesfully'
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
