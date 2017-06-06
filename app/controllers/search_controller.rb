class SearchController < ApplicationController
  def index
    service = BestBuyService.new
    @stores = service.stores(params[:zip_code])
  end
end
