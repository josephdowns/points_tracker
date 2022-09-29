class Api::V1::UserPointsController < ApplicationController
  def create
    points = UserPoint.new(user_points_params)
    if points.save
      render json: UserPointSerializer.add_points(points), status: :created
    else 
      render json: {error: "Cannot save"}, status: 404
    end
  end

  private

  def user_points_params
    params.permit(:payer, :points)
  end
end