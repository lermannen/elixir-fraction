defmodule FractionTest do
  use ExUnit.Case
  doctest Fraction

  describe "new" do
    test "Expresses the fraction in terms of the lowest denominator" do
      assert Fraction.new(4,2) == %Fraction{numerator: 2, denominator: 1}
    end

    test "no floats allowed" do
      assert_raise ArithmeticError, fn -> Fraction.new(2.0) end
    end

    test "new/1 is new/2 with denominator 1" do
      assert Fraction.new(5) == %Fraction{numerator: 5, denominator: 1}
    end
  end

  describe "add/2" do
    test "0 + 0 = 0" do
      assert Fraction.add(0, 0) == %Fraction{numerator: 0, denominator: 1}
    end

    test "1 + 0 = 0" do
      assert Fraction.add(1, 0) == %Fraction{numerator: 1, denominator: 1}
    end

    test "0 + 1 = 1" do
      assert Fraction.add(0, 1) == %Fraction{numerator: 1, denominator: 1}
    end

    test "7/9 + 1/2 = 23/18" do
      assert Fraction.add(Fraction.new(7,9), Fraction.new(1,2)) ==
        %Fraction{numerator: 23, denominator: 18}
    end
  end

  describe "multiply/2" do
    test "3/4 * 4/5 = 3/5" do
      assert Fraction.multiply(Fraction.new(3, 4), Fraction.new(4, 5)) ==
        %Fraction{numerator: 3, denominator: 5}
    end

    test "with 0" do
      assert Fraction.multiply(Fraction.new(3, 4), Fraction.new(0, 5)) ==
        %Fraction{numerator: 0, denominator: 1}
    end
  end

  describe "division/2" do
    test "1/2  / 3/4 = 2/3" do
      assert Fraction.division(Fraction.new(1, 2), Fraction.new(3, 4)) ==
        %Fraction{numerator: 2, denominator: 3}
    end

    test "with 0" do
      assert Fraction.multiply(Fraction.new(3, 4), Fraction.new(0, 5)) ==
        %Fraction{numerator: 0, denominator: 1}
    end
  end

  describe "subtraction/2" do
    test "1/2 - 3/4 = -1/4" do
      assert Fraction.subtraction(Fraction.new(1, 2), Fraction.new(3, 4)) ==
        %Fraction{numerator: -1, denominator: 4}
    end

    test "with 0" do
      assert Fraction.subtraction(Fraction.new(3, 4), Fraction.new(0, 5)) ==
        %Fraction{numerator: 3, denominator: 4}
    end
  end

  test "reciprocal/1" do
    assert Fraction.reciprocal(Fraction.new(3, 18)) == Fraction.new(6,1)
  end
end
