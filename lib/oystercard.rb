class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_LIMIT = 90
  MINIMUM_LIMIT = 1

  attr_reader :balance, :in_journey, :station

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
    @station = ""
  end

  def top_up(amount)
    fail "Exceeded top-up maximum amount of #{MAXIMUM_LIMIT}" if amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient funds" if balance < MINIMUM_LIMIT
    @in_journey = true
    @station << history
  end

  def touch_out
    @in_journey = false
    @balance -= 2
  end

  def history
    "richmond"
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
