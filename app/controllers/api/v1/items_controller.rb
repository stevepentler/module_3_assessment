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
    item = Item.create(params[:item])
    respond_with item
  end

  private

  def select_attributes
    {except: [:updated_at, :created_at]}
  end
end