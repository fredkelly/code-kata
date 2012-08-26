require './chop'
require 'test/unit'

class TestChop < Test::Unit::TestCase
  def test_chop
    assert_equal(-1, Kata.chop(3, []))
    assert_equal(-1, Kata.chop(3, [1]))
    assert_equal(0,  Kata.chop(1, [1]))
    #
    assert_equal(0,  Kata.chop(1, [1, 3, 5]))
    assert_equal(1,  Kata.chop(3, [1, 3, 5]))
    assert_equal(2,  Kata.chop(5, [1, 3, 5]))
    assert_equal(-1, Kata.chop(0, [1, 3, 5]))
    assert_equal(-1, Kata.chop(2, [1, 3, 5]))
    assert_equal(-1, Kata.chop(4, [1, 3, 5]))
    assert_equal(-1, Kata.chop(6, [1, 3, 5]))
    #
    assert_equal(0,  Kata.chop(1, [1, 3, 5, 7]))
    assert_equal(1,  Kata.chop(3, [1, 3, 5, 7]))
    assert_equal(2,  Kata.chop(5, [1, 3, 5, 7]))
    assert_equal(3,  Kata.chop(7, [1, 3, 5, 7]))
    assert_equal(-1, Kata.chop(0, [1, 3, 5, 7]))
    assert_equal(-1, Kata.chop(2, [1, 3, 5, 7]))
    assert_equal(-1, Kata.chop(4, [1, 3, 5, 7]))
    assert_equal(-1, Kata.chop(6, [1, 3, 5, 7]))
    assert_equal(-1, Kata.chop(8, [1, 3, 5, 7]))
  end
end