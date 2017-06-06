class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/v1/")
  end

  def stores(location)
    parse(connection.get("stores(area(#{location},25))",
                    { format: 'json',
                      show: 'storeId,storeType,name,city,distance,phone',
                      apiKey: ENV['BB_API_KEY'] }))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
