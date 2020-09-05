require "./lib/connect_four"

describe ConnectFour do
  subject { ConnectFour.new }

  describe "#place_chip" do
    it "places a chip at the bottom of an empty column" do
      subject.place_chip(0, "@")

      expect(subject.grid[0][0]).to eql("@")
    end

    it "places a chip on top of another chip" do
      subject.place_chip(0, "@")
      subject.place_chip(0, "O")

      expect(subject.grid[0][1]).to eql("O")
    end

    it "places chips in different columns" do
      subject.place_chip(0, "@")
      subject.place_chip(1, "O")

      expect(subject.grid[1][0]).to eql("O")
    end

    it "does not place a chip when column is full" do
      subject.place_chip(2, "O")
      subject.place_chip(2, "O")
      subject.place_chip(2, "O")
      subject.place_chip(2, "O")
      subject.place_chip(2, "O")
      subject.place_chip(2, "O")
      subject.place_chip(2, "@")


      expect(subject.grid[2][5]).to eql("O")
    end
  end
end