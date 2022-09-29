require 'rails_helper'

RSpec.describe "User Points API" do
  before :each do
    UserPoint.create(payer: "Dannon", points: 300)
    UserPoint.create(payer: "Unilever", points: 200)
    UserPoint.create(payer: "Dannon", points: -200)
    UserPoint.create(payer: "Miller Coors", points: 10000)
    UserPoint.create(payer: "Dannon", points: 1000)
  end

  it "can create an new user_point" do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    points_params = {
      'payer': "Target",
      'points': 460
    }

    post "/api/v1/user_points", headers: headers, params: JSON.generate(points_params)
    create_points = UserPoint.last
    expect(create_points.payer).to eq("Target")
    expect(create_points.points).to eq(460)

  end
end