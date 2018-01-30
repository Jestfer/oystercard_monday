require 'oystercard'

describe Oystercard do

  describe "#new card" do

    it "should have a default balance of #{Oystercard::DEFAULT_BALANCE}" do
      expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
    end

  end

  describe "#top-up" do

    it 'should top-up oyster by n amount' do
      expect{ subject.top_up(5) }.to change{ subject.balance }.by 5
    end

    it 'should not exceed maximum limit' do
      expect{ subject.top_up(Oystercard::MAXIMUM_LIMIT + 1) }.to raise_error("Exceeded top-up maximum amount of #{Oystercard::MAXIMUM_LIMIT}")
    end
  end

  describe "#deduct" do

    it "should deduct oyster bt n amount" do
      expect{ subject.deduct(5) }.to change{ subject.balance }.by -5
    end
  end

  describe "#in_journey?" do
    it "should be false at start" do
      expect(subject.in_journey?). to eq false
    end
  end
end
