class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title, :subscription_plans_attributes
  has_many :subscription_plans, :inverse_of => :newspaper
  accepts_nested_attributes_for :subscription_plans, :reject_if => Proc.new { |sub| sub[:price].blank? }
  validates :title, :presence => true

  def self.search(params)
    @sub = SubscriptionPlan
    if params
      unless params[:price].blank?
        @sub = @sub.where("price < ?", params[:price].to_i)
      end

      unless params[:freq].blank?
        bool = params[:freq] == "true" ? true : false
        @sub = @sub.where("weekly = ?", bool)
      end

      unless params[:title].blank?
        newspapers = []
        @sub.all.each{|sub| newspapers << sub.newspaper}
        return newspapers.select{|paper| paper.title.match(params[:title])}.uniq
      end
    end
    newspapers = []
    @sub.all.each{|sub| newspapers << sub.newspaper}
    return newspapers.uniq
  end
end
