class Journey

  attr_reader :details

  def initialize
    @details = {}
  end

  def start(station)
    # @entry_station = station
    @details[:entry_station] = station
  end

end
