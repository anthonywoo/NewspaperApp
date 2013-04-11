class UsersController < ApplicationController

  def new
    @user = User.new
    @newspapers = Newspaper.includes(:subscription_plans)
  end

  def create
    @user = User.new(params[:user])
    #subs = SubscriptionPlan.get_subs(params[:sub])
    #@user.subscription_plan_ids = subs
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
    #subs = SubscriptionPlan.get_subs(params[:sub])
    #@user.subscription_plan_ids = subs
    @user.attributes = params[:user]
    @user.save
    redirect_to user_url(@user)
  end
end
