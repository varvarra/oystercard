class OysterCard
  attr_reader :balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Attempted to top up beyond max value" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

end
