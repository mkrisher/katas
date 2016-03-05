require 'rspec'
require_relative 'counter'

describe Counter do
  subject { Counter.new }

  it "should convert 1 to a penny" do
    expect(subject.coins(1)).to eq(["penny"])
  end

  it "should convert 2 to two pennies" do
    expect(subject.coins(2)).to eq(["penny", "penny"])
  end

  it "should convert 6 to a nickel and a penny" do
    expect(subject.coins(6)).to eq(["nickel", "penny"])
  end

  it "should convert 10 to a dime" do
    expect(subject.coins(10)).to eq(["dime"])
  end

  it "should convert 17 to a dime, a nickel, and two pennies" do
    expect(subject.coins(17)).to eq(["dime", "nickel", "penny", "penny"])
  end

  it "should convert 25 to a quarter" do
    expect(subject.coins(25)).to eq(["quarter"])
  end

  it "should convert a dollar to four quarters" do
    expect(subject.coins(100)).to eq(["quarter", "quarter", "quarter", "quarter"])
  end
end
