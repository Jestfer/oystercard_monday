require 'oystercard'

describe Oystercard do

  describe "#new card" do

    it 'should have a default balance of 0' do
      expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
    end

  end

  describe "#top-up" do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'should top-up oyster by n amount' do
      expect{ subject.top_up(5) }.to change{ subject.balance }.by 5
    end
  end
end


