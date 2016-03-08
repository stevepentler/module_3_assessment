class SearchController < ApplicationController
  def index
    @items = Items.find_by(name: params[:name])
  end
end