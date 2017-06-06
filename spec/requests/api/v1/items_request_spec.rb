require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    3.times do |n|
      Item.create!(name: "item#{n}", description: "description#{n}", image_url: "url#{n}")
    end

    get '/api/v1/items'

    expect(response).to be_success

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
end
