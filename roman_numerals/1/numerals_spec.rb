require 'rspec'
require_relative 'numeral'

describe RomanNumeral do
  subject { RomanNumeral.new }

  it "should exist" do
    expect(subject).to_not eq(nil)
  end

  it "should convert 1 to I" do
    expect(subject.convert(1)).to eq("I")
  end

  it "should convert 2 to II" do
    expect(subject.convert(2)).to eq("II")
  end

  it "should convert 4 to IV" do
    expect(subject.convert(4)).to eq("IV")
  end

  it "should convert 5 to V" do
    expect(subject.convert(5)).to eq("V")
  end

  it "should convert 6 to VI" do
    expect(subject.convert(6)).to eq("VI")
  end

  it "should convert 9 to IX" do
    expect(subject.convert(9)).to eq("IX")
  end

  it "should convert 10 to X" do
    expect(subject.convert(10)).to eq("X")
  end

  it "should convert 20 to XX" do
    expect(subject.convert(20)).to eq("XX")
  end

end

