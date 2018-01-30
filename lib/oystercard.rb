class Oystercard
  DEFAULT_BALANCE = 0

  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    fail "Exceeded top-up maximum amount" if amount > 90
    @balance += amount
  end
end