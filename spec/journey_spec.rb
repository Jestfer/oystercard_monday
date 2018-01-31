require 'journey'

describe Journey do
  let (:entry_station) {"Victoria"}
  describe "#start" do
    it "should record the entry_station" do
      subject.start(entry_station)
      expect(subject.details[:entry_station]).to eq entry_station
    end
  end
  # start a journey
  # end a journey and record details
  #  calculate the fare
  #  return if the journey is complete
end
