class Api::V1::ItemsController < ApplicationController
  respond_to :json
  def index
    respond_with Item.all, select_attributes
  end

  def show
    item = Item.find(params[:id])
    respond_with item, select_attributes
  end

  def destroy
    respond_with Item.delete(params[:id])
  end

  def create
    item = Item.new
    Item.create(item_params)
    respond_with item
  end

  private

  def select_attributes
    {except: [:updated_at, :created_at]}
  end

  def item_params
    params.require(:item).permit(:name, :description, :updated_at, :created_at)
  end
end