class Api::V1::ItemsController < ApplicationController
  respond_to :json
  def index
    respond_with Item.all, except: [:updated_at, :created_at]
  end

  def show
    item = Item.find(params[:id])
    respond_with item
  end
end