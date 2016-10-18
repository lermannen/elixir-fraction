defmodule FractionTest do
  use ExUnit.Case
  doctest Fraction

  test "4+9 needs to work the same for fractions are for integers" do
  end

  test "floats and fractions don't work together" do
  end

  test "fractions are always expressed in the lowest terms" do
    assert Fraction.new(4,6) == %Fraction{numerator: 2, denominator: 3}
  end

  test "fractions are expressed as improper fractions" do
    assert Fraction.to_s(%Fraction{numerator: 5, denominator: 2}) == "5/2"
  end
end
