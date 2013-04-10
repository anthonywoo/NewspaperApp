class SubscriptionPlansController < ApplicationController

  def new
    @sub = SubscriptionPlan.new
    @sub.newspaper_id = params[:newspaper_id]
  end

  def create
    @sub = SubscriptionPlan.new(params[:subscription_plan])
    if @sub.save
      redirect_to newspaper_url(@sub.newspaper)
    else
      render :new
    end
  end
end
