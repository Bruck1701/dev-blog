class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update,:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]= "Welcome to Dev Blog, #{@user.username}! You have succesfully signed up!"
      redirect_to articles_path
    else
      render :new
    end
  end


  def edit

  end

  def update
    
    if @user.update(user_params)
      flash[:notice] ="Password changed succesfully"
      redirect_to articles_path
    else
      #flash[:notice] = @article.errors.full_messages
      render :edit
    end


  end

  def destroy
  end



  private
  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation)
  end

  def set_user
    @user=User.find(params[:id])
  end


end