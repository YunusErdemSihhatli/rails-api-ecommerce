class AddressesController < ApplicationController

  def index
    addresses = Address.where(customer_id: params[:customer_id])

    render json: addresses.extend(AddressesRepresenter).to_json
  end

  def show
    address = Address.find_by(id: params[:id])

    render json: address.extend(AddressRepresenter).to_json
  end

  def create
    address = Address.new(address_params)

    if address.save
      render json: { success: true }
    else
      render json: { success: false, errors: address.errors.full_messages.join(', ') }
    end
  end

  def update
    address = Address.find_by(id: params[:id])

    if address.update(address_params)
      render json: address.extend(AddressRepresenter).to_json
    else
      render json: { success: false, errors: address.errors.full_messages.join(', ') }
    end
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :phone, :title, :description, :city_name, :town_name, :customer_id)
  end

end
