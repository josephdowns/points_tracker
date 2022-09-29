class UserPoint < ApplicationRecord
  validates_presence_of :payer, :points

  def self.sum_points
    UserPoint.group(:payer).sum(:points)
  end
end
