require 'rspec'
require 'pry'
require_relative 'balancer'

describe Balancer do
  let(:word)  { "stead" }

  subject     { Balancer.new(word) }

  describe "#run" do
    it "returns the word with the balance point delimited by spaces" do
      expect(subject.run).to eq("s t ead")
    end
  end

  context "private api" do
    describe "#letter_weight" do
      it "returns the weight of a letter based on position in the alphabet" do
        expect(subject.send(:letter_weight, "s")).to eq(19)
      end
    end

    describe "#left_side" do
      let(:index) { 1 }

      it "returns the weight of the letters on the left side of the expected balance point" do
        expect(subject.send(:left_side, index)).to eq(19)
      end
    end

    describe "#right_side" do
      let(:index) { 1 }

      it "returns the weight of the letters on the right side of the expected balance point" do
        expect(subject.send(:right_side, index)).to eq(19)
      end
    end

    describe "#balanced?" do
      let(:index) { 1 }

      it "returns true if the left side and right side scores are equal" do
        expect(subject.send(:balanced?, index)).to eq(true)
      end
    end
  end
end

