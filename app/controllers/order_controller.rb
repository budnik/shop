class OrderController < ApplicationController
  respond_to :json, only: :create
  def create
    order = Order.new order_params
    if order.save?
      render json: {}, status: 201
    else
      render json: order.errors, status: 422
    end
  end

  private
  def order_params
    params.require(:order).permit(:product_ids, :company_name, :person_name, :phone, :note)
  end
end
