class ArticlesController < ApplicationController

  def index
    @articles = Article.all 
  end

  def show
    @article = Article.find(params[:id])
  end 

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other

    # The 303 See Other status code is typically returned as the result of a POST, PUT, or DELETE HTTP request. Essentially, it means that the result of the HTTP request can be found at a different URL. To fetch the new resource, the client must use a GET HTTP request with the specified Location
  end

  private 
  def article_params
    params.require(:article).permit(:title, :content)
  end

end
