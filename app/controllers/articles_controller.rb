class ArticlesController < ApplicationController


  def index 
    # when we want a list of available records, index.
    @articles = Article.all
  end 


  def show
    #byebug individual listing: show
    @article = Article.find(params[:id])
  end

end