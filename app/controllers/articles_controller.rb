class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(get_params)
    @article.save
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])   
  end

  def update
    @article = Article.find(params[:id])
    @article.update(get_params)
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete
    redirect_to articles_path
  end

  private
  def get_params
    params.require('article').permit(:title, :content)
  end
end
