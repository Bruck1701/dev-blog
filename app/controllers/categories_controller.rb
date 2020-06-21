class CategoriesController < ApplicationController
  
#before_action :require_user, only: [:new,:create]


def index
  @categories = Category.paginate(page: params[:page],per_page:5)
end

def show
  @category = Category.find(params[:id])
  @articles = @category.articles

end

def new
  @category = Category.new()
end


def create
  @category = Category.new(category_params)
  if @category.save
    flash[:notice] = "Category was successfully created"
    redirect_to @category
  else
    render 'new'
  end
end

private
def category_params
  params.require(:category).permit(:name)
end


end