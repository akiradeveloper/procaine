require 'helper'

class TestProcaine < Test::Unit::TestCase

  should "currying ok" do
    p = Proc.new { |x, y| x + y }
    q = p.curry(10)
    assert_equal( 12, q.call(2) )
  end

  should "curring ok 2" do
    p = Proc.new { |x,y,z| x+y+z }
    q = p.curry(1,2)
    assert_equal( 103, q.call(100) )
  end
    

  should "flipping ok" do
    p = Proc.new { |x, y| x ** y }
    assert_equal( 9, p.call(3, 2) )
    q = p.flip
    assert_equal( 8, q.call(3, 2) )
  end

  def blk_helper(&blk)
    blk.call(10)
  end

  should "ok in binding to blk" do
    n = blk_helper do |x|
      return x ** 3
    end
    assert( 1000, n ) 

    p = Proc.new { |x| x ** 2 }
    assert( 100, blk_helper(&p) )

    q = Proc.new { |x, y| x + y }
    r = q.curry(10)
    assert_equal( 20, blk_helper(&r) )

    s = p.flip
    assert_equal( 20, blk_helper(&r) )
  end

  should "arity correct" do
    p = Proc.new { |x, y| x + y }
    assert_equal( 2, p.arity )
    assert_equal( 1, p.curry(10).arity )
    assert_equal( 2, p.flip.arity )
  end

end
