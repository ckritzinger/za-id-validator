require 'helper'

class TestZaIdValidator < Test::Unit::TestCase

  include ZaIdValidator

  context "a valid ID number" do

    # Test and ID number based on data from
    # http://en.wikipedia.org/wiki/National_identification_number#South_Africa

    setup do
      @valid_integer = 8001015009087
      @valid = "8001015009087"
    end
    valid_numbers = ["8001015009087", "8811105212080", "8001155109085",
                     "8905110047083", "9206150098089", "8603245260081",
                     "8507095136087", "8211265026083", "8503225111082"]

    should "have the correct A sum" do
      # 8+0+0+5+0+0 = 13
      assert_equal 13, a(@valid)
    end

    should "have the correct B concatenation" do
      assert_equal "011098", b(@valid)
    end

    should "have the correct C value" do
      # (011098 * 2) = 22196
      # 2 + 2 + 1 + 9 + 6 = 20
      assert_equal 20, c(@valid)
    end

    should "have the right Z check digit" do
      assert_equal 7, z(@valid)
    end

    valid_numbers.each do |valid|
      should "#{valid} be the correct length" do
        assert length_is_valid?(valid)
      end

      should "#{valid} be a valid ID number" do
        result = valid_za_identity_number?(valid)
        assert_not_nil(result)
        assert(result)
      end
    end

    should "be a valid ID number (when passed as an int)" do
      result = valid_za_identity_number?(@valid_integer)
      assert_not_nil(result)
      assert(result)
    end

  end

  context "an invalid ID number" do

    setup do
      @invalid = "8001015009086"
    end

    should "not be a valid ID number" do
      result = valid_za_identity_number?(@invalid)
      assert_not_nil(result)
      assert(!result)
    end

  end

  context "an ID number that is too long" do

    setup do
      @too_long = "80010150090871"
      @too_long_integer = 80010150090871
    end

    should "not be a valid ID number" do
      result = valid_za_identity_number?(@too_long)
      assert_not_nil(result)
      assert(!result)
    end

    should "not be a valid ID number (when passed as an int)" do
      result = valid_za_identity_number?(@too_long_integer)
      assert_not_nil(result)
      assert(!result)
    end

  end

end
