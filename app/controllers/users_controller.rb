class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def initialize_user
    @user = User.new
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'static_pages/welcome'
    end
  end

  def show
  end


  private

  def find_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :email)
  end

end
