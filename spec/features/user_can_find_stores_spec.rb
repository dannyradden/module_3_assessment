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

      within('.pagination') do
        click_on '2'
      end

      query = URI.parse(current_url).query
      params = CGI::parse query

      expect(params["page"][0]).to eq('2')
      expect(page).to have_content '16 Total Stores'
      expect(find('.stores')).to have_selector('div', count: 6)

      within('#store0') do
        expect(page).to have_content 'I-70 AND TOWER RD CO'
        expect(page).to have_content 'City: AURORA'
        expect(page).to have_content 'Distance: 11.65 Miles'
        expect(page).to have_content 'Phone Number: 303-373-9284'
        expect(page).to have_content 'Store Type: Big Box'
      end
    end
  end
end
