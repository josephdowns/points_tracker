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

  it "spends points" do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      points: "5000"
    }

    patch "/api/v1/user_points", headers: headers, params: JSON.generate(params)
    spent = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(spent[:Unilever]).to eq(-200)
    expect(spent[:"Miller Coors"]).to eq(-4700)
    expect(spent[:Dannon]).to eq(-100)

    get "/api/v1/user_points", headers: headers
    index = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(index[:Dannon]).to eq(1000)
    expect(index[:Unilever]).to eq(0)
    expect(index[:"Miller Coors"]).to eq(5300)

  end

  it "cannot spend points you do not have" do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      points: "15000"
    }

    patch "/api/v1/user_points", headers: headers, params: JSON.generate(params)
    spent = JSON.parse(response.body, symbolize_names: true)[:error]

    expect(spent).to eq("Not enough points")
    expect(status).to be(404)
  end
end