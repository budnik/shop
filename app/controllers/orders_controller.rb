class OrdersController < ApplicationController
  respond_to :json, only: :create
  def create
    order = Order.new order_params
    if order.save
      render json: {message: 'Заказ отправлен'}, status: 201
    else
      render json: order.errors, status: 422
    end
  end

  private
  def order_params
    params.require(:order).permit(:price_id, product_ids: [])
  end
end
