require 'helper'

class TestZaIdValidator < Test::Unit::TestCase

  include ZaIdValidator

  context "a valid ID number" do

    # Test and ID number based on data from
    # http://en.wikipedia.org/wiki/National_identification_number#South_Africa

    setup do
      @valid = "8001015009087"
      @valid_integer = 8001015009087
    end

    should "be the correct length" do
      assert length_is_valid?(@valid)
      # flunk "hey buddy, you should probably rename this file and start testing for real"
    end

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

    should "be a valid ID number" do
      result = valid_za_identity_number?(@valid)
      assert_not_nil(result)
      assert(result)
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
