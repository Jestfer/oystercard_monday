require 'oystercard'

describe Oystercard do

  let(:station) {'a station'}

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

  describe "#in_journey?" do

    it "should be false at start" do
      expect(subject.in_journey?). to eq false
    end
  end

  context "when topped up £5 and touched in" do
    before do
      subject.top_up(5)
      subject.touch_in(station)
    end
    describe "#touch_in" do
      it "should change in-journey to true" do
        expect(subject.in_journey?).to eq true
      end

      it "records the entry station" do
        expect(subject.entry_station).to eq station
      end
    end

    describe "#touch_out" do
      it "should change in-journey back to false" do
        subject.touch_out
        expect(subject.in_journey?).to eq false
      end
      it "should deduct from card when touched out" do
        expect { subject.touch_out }.to change{ subject.balance }.by(-2)
      end
      it "should set the entry station to nil" do
        subject.touch_out
        expect(subject.entry_station).to eq nil
      end
    end
  end

  describe "#insufficient funds" do
    it "gives an error if insufficient funds on card when touch-in" do
      expect{ subject.touch_in(station) }.to raise_error("Insufficient funds")
    end
  end


end
