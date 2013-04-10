class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :price, :weekly, :newspaper_id
  belongs_to :newspaper

  validates :price, :newspaper, :presence => true
end
