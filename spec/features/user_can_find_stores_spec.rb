require 'rails_helper'

describe 'Dashboard' do
  it 'User can find nearest BestBuy stores' do
    visit root_path

    fill_in :zip_code, with: '80202'
    click_on 'search'

    expect(current_path).to eq("/search")

    expect(page).to have_content '16 Total Stores'
    expect(find('.stores')).to have_selector('div', count: 10)

    within('#store1') do
      expect(page).to have_content 'Name: CHERRY CREEK MALL'
      expect(page).to have_content 'City: DENVER'
      expect(page).to have_content 'Distance: 3.45 Miles'
      expect(page).to have_content 'Phone Number: 303-270-9189'
      expect(page).to have_content 'Store Type: Mobile SAS'
    end

# https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name,city,distance,phone&pageSize=10&apiKey=tq72hpvtbbd4mue6f23kmsw2

  end
end
