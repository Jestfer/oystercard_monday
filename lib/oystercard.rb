class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_LIMIT = 90

  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    fail "Exceeded top-up maximum amount of #{MAXIMUM_LIMIT}" if amount > 90

    @balance += amount
  end
end
