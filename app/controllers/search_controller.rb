class SearchController < ApplicationController
  def index
    @items = BestBuyService.new(params[:name]).get_products
  end
end