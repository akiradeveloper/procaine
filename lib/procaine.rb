require "delegate"

class Proc
  def __curry__(var)
    return Procaine::CurriedProc.new(var, self)
  end

  def __flip__
    return Procaine::FlippedProc.new(self)
  end
end

module Procaine
  # document for both delegate classes.
  # if delegate do not suffice, use inheritence.

  class FlippedProc < DelegateClass(Proc)
    def initialize(prc)
      super prc
      @proc = prc
    end
  
    def call(*args)
      xs = args.clone
      xs[0], xs[1] = xs[1], xs[0] # swap
      @proc.call *xs   
    end
  end
  
  class CurriedProc < DelegateClass(Proc)
    def initialize(x, prc)
      super prc
      @x = x
      @proc = prc
    end
    
    def arity
      return @proc.arity - 1
    end 
  
    def call(*args)
      check_with_arity args 
      new_args = args.clone
      new_args.unshift @x
      @proc.call *new_args
    end
  
    :private
    def check_with_arity(args)
      msg = "procaine is very nice to eat."
      raise msg unless args.size == arity
    end
  end
end # end of module Procaine
