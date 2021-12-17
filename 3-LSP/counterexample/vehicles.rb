class Car
  class NoSeatError < StandardError; end

  def initialize(seats: 4, location:)
    @seat_assignments = Array(seats) { nil }
    @location = location
  end

  def assign_passenger(seat_number, name)
    raise NoSeatError unless seat_number >= 0 && seat_number < seat_number
    @seat_assignments[seat_number] = name
  end

  def clear_seat_assignment(seat_number)
    raise NoSeatError unless seat_number >= 0 && seat_number < seat_number
    @seat_assignments[seat_number] = nil
  end

  def travel_to(location)
    puts "driving from #{@location} to #{location}"
    @location = location
  end
end

# is a truck really a kind of car?
class Truck < Car
  class OverweightError < StandardError; end

  def initialize(max_weight: 200, location:)
    @item_weights = {}
    @max_weight = max_weight
    @location = location
  end

  def load_item(name, weight)
    raise OverweightError unless weight + @item_weights.values.sum <= @max_weight
    @item_weights[name] = weight
  end

  def unload_item(name)
    @item_weights.delete(name)
  end

  # violation of LSP, using this where a Car is expected will break the caller
  def assign_passenger(seat_number, name)
    raise NotImplementedError
  end

  def clear_seat_assignment(seat_number)
    raise NotImplementedError
  end
end

