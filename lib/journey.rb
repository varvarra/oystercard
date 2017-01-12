#require 'oyster_card'
class Journey

  attr_accessor :entry_station

  def initialize(entry_station = nil,  exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def start(station)
    @entry_station = station
  end

end


# @journey = Hash.new
# @entry_station = entry_station
# @journey[:entry_station] = entry_station
