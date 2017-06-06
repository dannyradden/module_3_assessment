class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    Item.destroy(params[:id])
    head :no_content
  end

  def create
    render json: Item.create(item_params), status: :created
  end
end

private

def item_params
  params.require(:item).permit(:name, :description, :image_url)
end
