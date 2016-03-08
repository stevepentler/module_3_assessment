class SearchController < ApplicationController
  respond_to :json
 
  def index
    @service= BestBuyService.new(params[:name])
    @items = @service.get_products
  end
end