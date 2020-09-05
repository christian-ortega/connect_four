require "./lib/connect_four"
require "pry"

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

  describe "#game_over?" do
    it "returns true when board is full" do
      subject.place_chip(0, "O")
      subject.place_chip(0, "@")
      subject.place_chip(0, "O")
      subject.place_chip(0, "@")
      subject.place_chip(0, "O")
      subject.place_chip(0, "@")

      subject.place_chip(1, "O")
      subject.place_chip(1, "@")
      subject.place_chip(1, "O")
      subject.place_chip(1, "@")
      subject.place_chip(1, "O")
      subject.place_chip(1, "@")

      subject.place_chip(2, "@")
      subject.place_chip(2, "O")
      subject.place_chip(2, "@")
      subject.place_chip(2, "O")
      subject.place_chip(2, "@")
      subject.place_chip(2, "O")

      subject.place_chip(3, "O")
      subject.place_chip(3, "@")
      subject.place_chip(3, "O")
      subject.place_chip(3, "@")
      subject.place_chip(3, "O")
      subject.place_chip(3, "@")

      subject.place_chip(4, "O")
      subject.place_chip(4, "@")
      subject.place_chip(4, "O")
      subject.place_chip(4, "@")
      subject.place_chip(4, "O")
      subject.place_chip(4, "@")

      subject.place_chip(5, "@")
      subject.place_chip(5, "O")
      subject.place_chip(5, "@")
      subject.place_chip(5, "O")
      subject.place_chip(5, "@")
      subject.place_chip(5, "O")

      subject.place_chip(6, "O")
      subject.place_chip(6, "@")
      subject.place_chip(6, "O")
      subject.place_chip(6, "@")
      subject.place_chip(6, "O")
      
      expect(subject.place_chip(6, "@")).to eql(true)
    end

    it "returns true when four in a row" do
      subject.place_chip(1, "@")
      subject.place_chip(2, "@")
      subject.place_chip(3, "@")
      
      expect(subject.place_chip(4, "@")).to eql(true)
    end

    it "returns true when four in a column" do
      subject.place_chip(2, "O")
      subject.place_chip(2, "O")
      subject.place_chip(2, "O")

      expect(subject.place_chip(2, "O")).to eql(true)
    end

    it "returns true when four in a top-left to bottom-right diagonal" do
      subject.place_chip(2, "O")
      subject.place_chip(3, "O")
      subject.place_chip(4, "O")
      subject.place_chip(5, "@")

      subject.place_chip(2, "O")
      subject.place_chip(3, "O")
      subject.place_chip(4, "@")

      subject.place_chip(2, "O")
      subject.place_chip(3, "@")

      expect(subject.place_chip(2, "@")).to eql(true)
    end

    it "returns true when four in a bottom-left to top-right diagonal" do
      subject.place_chip(2, "@")
      subject.place_chip(3, "O")
      subject.place_chip(4, "O")
      subject.place_chip(5, "O")

      subject.place_chip(3, "@")
      subject.place_chip(4, "O")
      subject.place_chip(5, "O")

      subject.place_chip(4, "@")
      subject.place_chip(5, "O")

      expect(subject.place_chip(5, "@")).to eql(true)
    end

    it "returns false when not four in a row" do
      subject.place_chip(1, "@")
      subject.place_chip(2, "@")
      
      expect(subject.place_chip(3, "@")).to eql(false)
    end

    it "returns false when not four in a column" do
      subject.place_chip(2, "O")
      subject.place_chip(2, "O")

      expect(subject.place_chip(2, "O")).to eql(false)
    end

    it "returns false when not four in a top-left to bottom-right diagonal" do
      subject.place_chip(2, "O")
      subject.place_chip(3, "O")
      subject.place_chip(4, "O")
      subject.place_chip(5, "@")

      subject.place_chip(2, "O")
      subject.place_chip(3, "O")
      subject.place_chip(4, "@")

      subject.place_chip(2, "O")

      expect(subject.place_chip(3, "@")).to eql(false)
    end

    it "returns false when not four in a bottom-left to top-right diagonal" do
      subject.place_chip(2, "@")
      subject.place_chip(3, "O")
      subject.place_chip(4, "O")
      subject.place_chip(5, "O")

      subject.place_chip(3, "@")
      subject.place_chip(4, "O")
      subject.place_chip(5, "O")

      subject.place_chip(5, "O")

      expect(subject.place_chip(4, "@")).to eql(false)
    end
  end
end