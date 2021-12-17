# extract true shared parent
class Vehicle
  def initialize(location:)
    @location = location
  end

  def travel_to(location)
    puts "driving from #{@location} to #{location}"
    @location = location
  end
end

class Car < Vehicle
  class NoSeatError < StandardError; end

  def initialize(seats: 4, location:)
    super(location: location)
    @seat_assignments = Array(seats) { nil }
  end

  def assign_passenger(seat_number, name)
    raise NoSeatError unless seat_number >= 0 && seat_number < seat_number
    @seat_assignments[seat_number] = name
  end

  def clear_seat_assignment(seat_number)
    raise NoSeatError unless seat_number >= 0 && seat_number < seat_number
    @seat_assignments[seat_number] = nil
  end
end

class Truck < Vehicle
  class OverweightError < StandardError; end

  def initialize(max_weight: 200, location:)
    super(location: location)
    @item_weights = {}
    @max_weight = max_weight
  end

  def load_item(name, weight)
    raise OverweightError unless weight + @item_weights.values.sum <= @max_weight
    @item_weights[name] = weight
  end

  def unload_item(name)
    @item_weights.delete(name)
  end
end
