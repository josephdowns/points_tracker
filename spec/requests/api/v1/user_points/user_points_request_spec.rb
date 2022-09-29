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
    created = JSON.parse(response.body, symbolize_names: true)[:data]
    
    expect(response).to be_successful
    expect(create_points.payer).to eq("Target")
    expect(create_points.points).to eq(460)
    expect(created[:attributes][:payer]).to eq("Target")
    expect(created[:attributes][:points]).to eq(460)


  end

  it "can list all payers and points" do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    get "/api/v1/user_points", headers: headers
    index = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(index.keys.count).to eq(3)
    expect(index[:Unilever]).to eq(200)
  end
end