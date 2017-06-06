class SearchController < ApplicationController
  def index
    service = BestBuyService.new
    response = service.stores(params[:zip_code])
    @total = response[:total]
    @stores = response[:stores].map{ |store| OpenStruct.new(store)}
  end
end
