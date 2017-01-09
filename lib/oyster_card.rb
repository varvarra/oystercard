class OysterCard
  attr_reader :balance, :max_balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @max_balance = MAX_BALANCE
  end

  def top_up(amount)
    msg = "Attempted to top up beyond max value of £#{max_balance}.00"
    raise msg if balance + amount > max_balance
    @balance += amount
  end

end
