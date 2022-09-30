class UserPoint < ApplicationRecord
  validates_presence_of :payer, :points

  def self.sum_points
    UserPoint.group(:payer).sum(:points)
  end

  def self.spend_points(points)
    start = UserPoint.sum_points
    ordered = UserPoint.order(:created_at)
    ordered.each do |row|
      refresh = UserPoint.sum_points
      if points == 0
        break
      elsif row.points > points
        x = row.points - points
        points = 0
        row.update(points: x)
      elsif refresh[row.payer] - row.points >= 0
        points -= row.points
        row.update(points: row.points - row.points)
      end
    end
    finish = UserPoint.sum_points
    difference(start, finish)
  end

  def self.difference(start, finish)
    h = {}
    start.each do |payer, points|
      h[payer] = finish[payer] - start[payer]
    end
    h
  end
end
