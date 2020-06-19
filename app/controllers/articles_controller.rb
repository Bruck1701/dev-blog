class ArticlesController < ApplicationController
  before_action :set_article, only: [:show,:edit,:update,:destroy]
  before_action :require_user, except: [:index,:show]
  before_action :require_same_user, only: [:edit,:update,:destroy]

  def index 
    # when we want a list of available records, index.
    @articles = Article.paginate(page: params[:page],per_page:5)
  end 

  def show
    #byebug individual listing: show
  end


  def new
    @article = Article.new
  end
   

  def create
    #render plain: params[:article]
    #The create action is used to handle the form submission from the new article creation form.
    #Strong parameters to protect the model from receiving garbage from the web.
    @article = Article.new(article_params) 
    @article.user = current_user
    if @article.save
      flash[:notice]= "Article was created successfully!"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] ="Article updated succesfully"
      redirect_to @article
    else
      #flash[:notice] = @article.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Article deleted!"
    else
      flash[:notice] = @article.errors.full_messages
    end
    redirect_to articles_path
  end

  private 
  # only available on the controller
  def set_article
    @article = Article.find(params[:id])
  end 

  def article_params
    params.require(:article).permit(:title,:content,:category_id)
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = "You can only edit or delete your own articles! "
      redirect_to @article
    end

  end


end