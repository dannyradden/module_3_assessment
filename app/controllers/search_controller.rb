class SearchController < ApplicationController
  def index
    service = BestBuyService.new
    response = service.stores(params[:zip_code])
    @total = response[:total]
    @stores = response[:stores].map{ |store| OpenStruct.new(store)}.paginate(:page => params[:page], :per_page => 10)
  end
end
