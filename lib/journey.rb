#require 'oyster_card'
class Journey

  attr_accessor :entry_station, :exit_station

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end



end


# @journey = Hash.new
# @entry_station = entry_station
# @journey[:entry_station] = entry_station
