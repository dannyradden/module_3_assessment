require 'rails_helper'

describe 'Best Buy Service' do
  it 'finds stores within location' do
    VCR.use_cassette("services/find_stores") do
      @service = BestBuyService.new

      stores = @service.stores('80202')

      expect(stores[:total]).to eq(16)
      expect(stores[:stores].count).to eq(10)
      expect(stores[:stores].first[:storeId]).to eq(2740)
      expect(stores[:stores].first[:name]).to eq("CHERRY CREEK MALL")
      expect(stores[:stores].first[:city]).to eq("DENVER")
      expect(stores[:stores].first[:distance]).to eq(3.45)
      expect(stores[:stores].first[:phone]).to eq("303-270-9189")
      expect(stores[:stores].first[:storeType]).to eq("Mobile SAS")
      expect(stores[:stores].last[:storeId]).to eq(1171)
    end
  end
end
