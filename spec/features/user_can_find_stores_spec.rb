require 'rails_helper'

describe 'Dashboard' do
  it 'User can find nearest BestBuy stores' do
    visit root_path

    fill_in 'Zip Code', with: '80203'
    click_on 'search'

    expect(page).to have_current_path("/search")

    expect(page).to have_content '16 Total Stores'

    expect(page).to have_content 'Name: CHERRY CREEK MALL'

    # https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name&pageSize=10&apiKey=tq72hpvtbbd4mue6f23kmsw2

    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "16 Total Stores"
    # And I should see exactly 10 results
    # And I should see the long name, city, distance, phone number and store type for each of the 10 results
  end
end
