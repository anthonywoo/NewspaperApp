class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :price, :weekly, :newspaper_id
  belongs_to :newspaper

  validates :price, :newspaper, :presence => true

  def self.get_subs(params) #Rewrote users/form - no longer using this
    subs = []
    params.each do |k,v|
      subs << v unless v.blank?
    end
    subs
  end
end
