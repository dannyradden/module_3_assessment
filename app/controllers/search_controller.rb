class SearchController < ApplicationController
  def index
    service = BestBuyService.new
    @stores = service.stores(params[:zip_code])
    require "pry"; binding.pry
  end
end
