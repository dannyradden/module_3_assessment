require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    3.times do |n|
      Item.create!(name: "item#{n}", description: "description#{n}", image_url: "url#{n}")
    end

    get '/api/v1/items'

    expect(response.status).to eq(200)

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
    expect(items.first).to have_key("id")
    expect(items.first).to have_key("name")
    expect(items.first["name"]).to eq("item0")
    expect(items.first).to have_key("description")
    expect(items.first).to have_key("image_url")
    expect(items.first).to_not have_key("created_at")
    expect(items.first).to_not have_key("updated_at")
  end

  it "sends a single item" do
    3.times do |n|
      Item.create!(name: "item#{n}", description: "description#{n}", image_url: "url#{n}")
    end

    get '/api/v1/items/1'

    expect(response.status).to eq(200)

    item = JSON.parse(response.body)

    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item["name"]).to eq("item0")
    expect(item).to have_key("description")
    expect(item).to have_key("image_url")
    expect(item).to_not have_key("created_at")
    expect(item).to_not have_key("updated_at")
  end

  it "can delete an item" do
    3.times do |n|
      Item.create!(name: "item#{n}", description: "description#{n}", image_url: "url#{n}")
    end

    delete '/api/v1/items/1'

    expect(response.status).to eq(204)
    expect(Item.count).to eq(2)
  end

  it "creates an item" do
    item_params = { name: "Cup", description: "Drink Me", image_url: 'www.cupimage.com' }
    # 
    # post '/api/v1/items?name='
    #
    # expect(response.status).to eq(200)
    #
    # item = JSON.parse(response.body)
    #
    # expect(item).to have_key("id")
    # expect(item).to have_key("name")
    # expect(item["name"]).to eq("item0")
    # expect(item).to have_key("description")
    # expect(item).to have_key("image_url")
    # expect(item).to_not have_key("created_at")
    # expect(item).to_not have_key("updated_at")
  end
end
