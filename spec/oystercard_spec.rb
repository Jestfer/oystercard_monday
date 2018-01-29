require 'oystercard'

describe Oystercard do

  describe "#new card" do

    it 'should have a default balance of 0' do
      expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
    end

  end

  describe "#top-up" do

    before do
      @new_oyster = Oystercard.new(5)
      @pounds = 5
    end

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'should top-up oyster by n amount' do
      ### WE NEED TO TOP_UP BALANCE, NOT TO RETURN TOP_UP AMOUNT
      expect(subject.top_up(@pounds)).to eq @new_oyster.balance
    end
  end
end


