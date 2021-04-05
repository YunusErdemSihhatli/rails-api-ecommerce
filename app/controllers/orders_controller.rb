class OrdersController < ApplicationController

  def index
    orders = Order.where(customer_id: params[:customer_id])

    render json: orders.extend(OrdersRepresenter).to_json
  end

  def show
    order = Order.find_by(id: params[:id])

    render json: order.extend(OrderRepresenter).to_json
  end

  def create
    order = Order.new(order_params)

    if order.save!
      render json: { success: true }
    else
      render json: { success: false, errors: order.errors.full_messages.join(', ') }
    end
  end

  def update
    order = Order.find_by(id: params[:id])

    if order.update(state: Order.states.key(params[:state]))
      render json: customer.extend(OrderRepresenter).to_json
    else
      render json: { success: false, errors: order.errors.full_messages.join(', ') }
    end
  end

  private

  def order_params
    params.require(:order).permit(:cart_id, :customer_id)
  end

end
