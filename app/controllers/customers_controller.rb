class CustomersController < ApplicationController

  def show
    customer = Customer.find_by(id: params[:id])

    render json: customer.extend(CustomerRepresenter).to_json
  end

  def create
    customer = Customer.new(customer_params)

    if customer.save
      render json: { success: true }
    else
      render json: { success: false, errors: customer.errors.full_messages.join(', ') }
    end
  end

  def update
    customer = Customer.find_by(id: params[:id])

    if customer.update(customer_params)
      render json: customer.extend(CustomerRepresenter).to_json
    else
      render json: { success: false, errors: customer.errors.full_messages.join(', ') }
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email)
  end

end
