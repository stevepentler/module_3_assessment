class Api::V1::ItemsController < ApplicationController
  respond_to :json
  def index
    respond_with Item.all, except: [:updated_at, :created_at]
  end
end