class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def new
    @user = User.new
  end

  def index
    @pagy, @users = pagy(User.all, items: 2)
  end

  def create
   @user = User.new(user_params)
   if @user.save
     flash[:success] = "Welcome to the alpha blog #{@user.username}"
     redirect_to article_path
   else
     render 'new'
   end
  end

  def edit
    #@user = User.find(params[:id])

  end

  def show
    #@user = User.find(params[:id])
  end


  def update
    #@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
