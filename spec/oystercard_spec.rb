require 'oystercard'

describe Oystercard do

  describe "#new card" do

    before do
      @oystercard = Oystercard.new
    end

    it 'should have a default balance of 0' do
      expect(@oystercard.balance).to eq 0
    end
  end
end


