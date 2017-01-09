class OysterCard
  attr_reader :balance, :max_balance
  MAX_BALANCE = 90

  def initialize(max_balance=MAX_BALANCE)
    @balance = 0
    @max_balance = max_balance
  end

  def top_up(amount)
    msg = "Attempted to top up beyond max value of £#{max_balance}.00"
    raise msg if balance + amount > max_balance
    @balance += amount
  end

end
