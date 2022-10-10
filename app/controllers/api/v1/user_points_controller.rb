class Api::V1::UserPointsController < ApplicationController
  def create
    points = UserPoint.new(user_points_params)
    if points.save
      render json: UserPointSerializer.add_points(points), status: :created
    else 
      render json: {error: "Cannot save"}, status: 404
    end
  end

  def index
    points = UserPoint.sum_points
    render json: UserPointSerializer.total_points(points)
  end

  def update
    if UserPoint.enough_points?((params[:points]).to_i)
      used_points = UserPoint.spend_points((params[:points]).to_i)
      render json: UserPointSerializer.new_total(used_points)
    else
      render json: {error: "Not enough points"}, status: 404
    end
  end

  private

  def user_points_params
    params.permit(:payer, :points)
  end
end