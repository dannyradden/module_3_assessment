require 'rails_helper'

describe 'Dashboard' do
  it 'User can find nearest BestBuy stores' do
    VCR.use_cassette("features/find_stores") do
      visit root_path

      fill_in :zip_code, with: '80202'
      click_on 'search'

      expect(current_path).to eq("/search")

      expect(page).to have_content '16 Total Stores'
      expect(find('.stores')).to have_selector('div', count: 10)

      within('#store0') do
        expect(page).to have_content 'Name: CHERRY CREEK MALL'
        expect(page).to have_content 'City: DENVER'
        expect(page).to have_content 'Distance: 3.45 Miles'
        expect(page).to have_content 'Phone Number: 303-270-9189'
        expect(page).to have_content 'Store Type: Mobile SAS'
      end

# And I should see pagination links below the search results for the number of pages (2 in this case)
# And `1` is my current page but isn't a clickable link
# And `2` is a clickable link
# When I click `2`
# Then I should be taken to the next page of search results
# Then my current path should be "/search" (ignoring params)
# And in the params I should see `page=2`
# And I should see stores within 25 miles
# And I should see a message that says "16 Total Stores"
# And I should see the next 6 results
# And I should see the long name, city, distance, phone number and store type for each of the next 6 results
    end
  end
end
