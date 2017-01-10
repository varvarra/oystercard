class OysterCard
  attr_reader :balance, :max_balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @max_balance = MAX_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    msg = "Attempted to top up beyond max value of £#{max_balance}.00"
    raise msg if balance + amount > max_balance
    @balance += amount
  end

  def deduct(amount)
    msg = "You don't have enough balance"
    raise msg if balance - amount < 0
    @balance -= amount
    #@in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
