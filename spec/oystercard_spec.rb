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
  end
end


