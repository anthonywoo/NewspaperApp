class UsersController < ApplicationController

  def new
    @user = User.new
    @newspapers = Newspaper.includes(:subscription_plans)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_url
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @newspapers = Newspaper.includes(:subscription_plans)
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to user_url(@user)
  end
end
