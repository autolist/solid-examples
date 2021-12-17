module VehiclePresentationHelpers
  include ActionView::Helpers::NumberHelper

  def marketing_title(vehicle)
    "Great #{vehicle.year} #{vehicle.make} #{vehicle.model} #{vehicle.trim} for sale for only #{humanized_price(vehicle)}!" 
  end

  def vdp_title(vehicle)
    "#{vehicle.year} #{vehicle.make} #{vehicle.model}"
  end

  def vdp_details(vehicle)
    {
      trim: vehicle.trim,
      price: vehicle.price,
      vin: vehicle.vin
    }
  end

  private

  def humanized_price(vehicle)
    number_to_currency(@price)
  end
end