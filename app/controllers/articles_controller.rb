class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :destroy, :update]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show

  end

  def edit

  end

  def update
    @article.update(article_params)
    if @article.save
      flash[:alert] = "Update success"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Create a new Article"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def destroy
    @article.delete
    flash[:notice] = "Delete success"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find(params[:id])
  end




end