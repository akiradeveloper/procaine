require "delegate"

class Proc
  def __curry__(var)
    return CurriedProc.new(var, self)
  end

  def __flip__
    return FlippedProc.new(self)
  end
end

class FlippedProc < DelegateClass(Proc)
  def initialize(prc)
    super(prc)
    @proc = prc
  end


  def call(*args)
    xs = args.clone
    xs[0], xs[1] = xs[1], xs[0] # swap
    @proc.call(*xs)   
  end

end

# if delegate do not suffice, use inheritence
class CurriedProc < DelegateClass(Proc)
  def initialize(x, prc)
    super(prc)
    @x = x
    @proc = prc
  end
  
  def arity
    return (@proc.arity - 1)
  end 

  def call(*args)
    check_with_arity(args, @proc)
    new_args = args.clone
    new_args.unshift(@x)
    @proc.call( *new_args )
  end

  def panic(msg)
    # todo
  end

  def check_with_arity(args, f)
    msg = "todo"
    panic(msg) unless args.size == f.arity
  end
end

if __FILE__ == $0
  # f = define_singleton_method(:hoge) { |x| x**5 }
  # puts f
  
  p = Proc.new { |x, y| x ** y }
  # puts p
  # puts p.call(1, 1)
  
  q = p.__curry__(1)
  puts q.call(2)
  puts q.arity

  r = p.__flip__
  puts p.call(2,3)
  puts r.call(2,3)
end
