class OysterCard
  attr_reader :balance, :max_balance, :entry_station

  MAX_BALANCE = 90
  MIN_JOURNEY_FUND = 1
  FARE = 5

  def initialize
    @balance = 0
    @max_balance = MAX_BALANCE
  end

  def top_up(amount)
    msg = "Attempted to top up beyond max value of £#{max_balance}.00"
    raise msg if balance + amount > max_balance
    @balance += amount
  end

  def touch_in(entry_station)
    msg = "Insufficient funds"
    raise msg if balance < MIN_JOURNEY_FUND
    @entry_station = entry_station
  end

  def touch_out
    deduct(FARE)
    @entry_station = nil
  end

  def in_journey?
    #@entry_station.nil? ? false : true
    !!@entry_station
  end

  private
  attr_accessor :deduct

  def deduct(amount)
    msg = "You don't have enough balance"
    raise msg if balance - amount < 0
    @balance -= amount
    #@in_journey = true
  end

end
