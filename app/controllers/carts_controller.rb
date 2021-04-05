class CartsController < ApplicationController

  def show
    cart = Cart.find_by(id: params[:id])

    render json: cart.extend(CartRepresenter).to_json
  end

  def create
    cart = Cart.new(cart_params)

    if cart.save
      render json: { success: true }
    else
      render json: { success: false, errors: cart.errors.full_messages.join(', ') }
    end
  end

  def update
    cart = Cart.find_by(id: params[:id])

    if cart.update(cart_params)
      render json: cart.extend(CartRepresenter).to_json
    else
      render json: { success: false, errors: cart.errors.full_messages.join(', ') }
    end
  end

  def create_line_item
    line_item = LineItem.new(line_item_params)

    if line_item.cart_id.blank?
      line_item.cart_id = params[:id]
    end

    if line_item.save
      render json: { success: true }
    else
      render json: { success: false, errors: line_item.errors.full_messages.join(', ') }
    end
  end

  def update_line_item
    cart = Cart.find_by(id: params[:id])
    line_item = cart.line_items.find_by(product_id: line_item_params["product_id"])

    if line_item.update(piece: line_item_params["piece"])
      render json: { success: true }
    else
      render json: { success: false, errors: line_item.errors.full_messages.join(', ') }
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:customer_id, :address_id)
  end

  def line_item_params
    params.require(:line_item).permit(:piece, :product_id, :cart_id)
  end

end
