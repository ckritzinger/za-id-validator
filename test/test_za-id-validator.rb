require 'helper'

class TestZaIdValidator < Test::Unit::TestCase

  include ZaIdValidator

  context "a valid ID number" do

    # Test and ID number based on data from
    # http://en.wikipedia.org/wiki/National_identification_number#South_Africa

    setup do
      @valid = "8001015009087"
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
      assert valid_za_identity_number?(@valid)
    end

  end

  context "an invalid ID number" do

    setup do
      @invalid = "8001015009086"
    end

    should "not be a valid ID number" do
      assert !valid_za_identity_number?(@invalid)
    end

  end

end
