class GoodsController < ApplicationController
  
  before_action :set_good, only: [:show, :update, :destroy]
  before_action :set_params, only: [:index]

  # GET /goods
  def index
    goods = Good.paginate( page: params[:page][:number] )
    json_response(goods)
  end

  # POST /goods
  def create
    good = Good.create!(good_params)
    json_response(good, :created)
  end

  # GET /goods/:id
  def show
    json_response @good
  end

  # PUT/PATCH /goods/:id
  def update
    @good.update!(good_params)
    head :no_content
  end

  # DELETE /goods/:id
  def destroy
    @good.destroy
    head :no_content
  end

  private

  def good_params
    params.permit(:name, :description, :price)
  end

  def set_good
    @good = Good.find(params[:id])
  end

  def set_params
    if params.dig(:page, :number).nil?
      params[:page] = {:number=>1}
    end
  end
end
