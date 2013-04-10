class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title, :subscription_plans_attributes
  has_many :subscription_plans
  accepts_nested_attributes_for :subscription_plans, :reject_if => lambda { |sub| sub[:price].blank? }

end
