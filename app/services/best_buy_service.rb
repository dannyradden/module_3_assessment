class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/v1/")
  end

  def stores(location)
    parse(connection.get("stores(area(#{location},25))" #&apiKey=tq72hpvtbbd4mue6f23kmsw2,
                        { format: 'json',
                          show: 'storeId,storeType,name,city,distance,phone&page',
                          pageSize: 10,
                          api_key: ENV['BB_API_KEY'] })

  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
