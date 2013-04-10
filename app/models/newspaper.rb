class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title, :subscription_plans_attributes
  has_many :subscription_plans, :inverse_of => :newspaper
  accepts_nested_attributes_for :subscription_plans, :reject_if => Proc.new { |sub| sub[:price].blank? }
  validates :title, :presence => true

  def self.search(params)
    newspaper = Newspaper
    unless params[:title].blank?
      newspaper = newspaper.where("title like ?", "%#{params[:title]}%")
    end
    newspaper.all
  end
end
