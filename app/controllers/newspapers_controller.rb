class NewspapersController < ApplicationController

  def index
    @newspapers = Newspaper.search(params[:newspaper])
    #@newspapers = Newspaper.all
  end

  def show
    @newspaper = Newspaper.find(params[:id])
  end

  def new
    @count = params[:sub_count].nil? ? 1 : params[:sub_count].to_i + 1
    @newspaper = Newspaper.new
    @count.times {@newspaper.subscription_plans.build}
    # @newspaper.subscription_plans.build
  end

  def create
    @newspaper = Newspaper.new(params[:newspaper])
    if @newspaper.save
      redirect_to newspapers_url
    else
      render :new
    end
  end

  def search
    @newspapers = Newspaper.search(params[:newspaper])
    #render :index
  end
end
