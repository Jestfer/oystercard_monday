class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_LIMIT = 90
  MINIMUM_LIMIT = 1

  attr_reader :balance, :in_journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail "Exceeded top-up maximum amount of #{MAXIMUM_LIMIT}" if amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in

    fail "Insufficient funds" if balance < MINIMUM_LIMIT
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
