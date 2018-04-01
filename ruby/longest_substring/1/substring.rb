require 'rubygems'
require 'rspec'
require 'rb-readline'
require 'pry'


# longest substring from a given input, input can be multiple strings
#
#
# abba,abc #=> ab
# z25, af25c #=> 25
# abc, abcd #=> abc
# ghi, klm #=> null
#
#
# SubstringFinder.new(array of strings).longest_substring # => 'ab'

#class SubstringFinder
#  attr_accessor :array_of_strings
#
#  def initialize(strings)
#    @array_of_strings = strings
#  end
#
#  def longest_substring
#    compare_inputs
#  end
#
#  private
#
#  def compare_inputs
#    first_string  = @array_of_strings[0]
#    second_string = @array_of_strings[1]
#
#    first_string_arr  = first_string.split(//)
#    second_string_arr = second_string.split(//)
#    substrings        = []
#    substring         = []
#
#    first_string_arr.each_with_index do |char, index| # 0, 1, 2
#      if second_string_arr[index] == char # a, b, b  works only if indexes match
#        substring << char # a, b
#        next
#      else
#        substrings << substring unless substring.empty?
#        substring = []
#
#        next
#      end
#    end
#
#    # return the longest sub in our subs
#    substrings.sort_by { |sub| sub.size }.reverse
#
#    return substrings.first.join
#  end
#end

#RSpec.describe SubstringFinder do
#  let(:strings) { ['abba','abc'] }
#
#  subject { described_class.new(strings) }
#
#  describe "#longest_substring" do
#    it "returns the longest matching substrings from a given list of strings" do
#      expect(subject.longest_substring).to eq('ab')
#    end
#  end
#
#  context "with longest string at the end of a string" do
#    let(:strings) { ['zxcab','weabc'] }
#
#    subject { described_class.new(strings) }
#
#    describe "#longest_substring" do
#      it "returns the longest matching substrings from a given list of strings" do
#        expect(subject.longest_substring).to eq('ab')
#      end
#    end
#  end
#end

class StringFinder
  attr_accessor :strings, :substring_results

  def initialize(arr_of_strings)
    @strings           = arr_of_strings
    @substring_results = []
  end

  def find_longest_substring
    first_string  = @strings.first
    second_string = @strings.last

    first_string.split(//).each_with_index do |char, index|
      substrings = split_into_substrings(char, second_string)

      substrings.each do |substring|
        compare_strings(first_string[index, first_string.length], substring)
      end
    end

    return longest_substring
  end

  def longest_substring
    @substring_results.sort_by { |sub| sub.length }.last
  end

  def compare_strings(first_string, substring)
    match = ''

    substring.split(//).each_with_index do |char, index| # 'abba', 'ab'
      if first_string[index] == char
        match += char

        if index + 1 == substring.length
          @substring_results << match
        end

        next
      else
        @substring_results << match

        match = ''

        break # we're done matching this substring, go to the next
      end
    end

    # TODO: refactor
    # doesn't return anything, just appended to @substring_results
  end

  # return substrings from a given string that begin with a character
  # for example: 'ababc' yields 'ababc' and 'abc' given the character 'a'
  def split_into_substrings(char, string)
    substrings = []

    string.split(//).each_with_index do |string_char, index|
      if string_char == char
        substring = string[index,string.length]
        substrings << substring if substring.length > 1
      end
    end

    return substrings
  end
end

RSpec.describe StringFinder do
  let(:strings) { ['abba','abc'] }

  subject { described_class.new(strings) }

  describe "#longest_substring" do
    it "returns the longest matching substrings from a given list of strings" do
      expect(subject.find_longest_substring).to eq('ab')
    end
  end

  context "with longest string at the end of a string" do
    let(:strings) { ['amikeb','abmike'] }

    subject { described_class.new(strings) }

    describe "#longest_substring" do
      it "returns the longest matching substrings from a given list of strings" do
        expect(subject.find_longest_substring).to eq('mike')
      end
    end
  end

  describe "#split_into_substrings" do
    let(:string) { 'abbabc' }
    let(:char)   { 'a' }

    it "should return substrings that start with a" do
      expect(subject.split_into_substrings(char, string)).to eq(['abbabc', 'abc'])
    end
  end
end

