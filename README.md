# Procaine
Curring for Proc.

## Motivation
Resuing a function should be easier.
Why do we have to wrap existing function by new function to reuse it?
In functional programming, currying enables reuse of function easier than case in OOP.
Ruby, a functional programming language, however, does not have such functinality and 
it have been told unknown the reason.

Procaine, a name of anesthesia, provides you these basic functionality with Proc class
which is widely used in Ruby programs in block, the return value of lambda and proc itself.
With this Proc extension, your Ruby code will be more functional and therefore readable.

## Usage
```ruby
p = Proc.new { |x,y,z| x**y+z }

# currying
q = p[2,3] #=> return a function equivalent to ->(x){ 2**3+x } .
q.call(4) #=> 12

# flipping
r = p.flip #=> return a function equivalent to ->(x,y,z){ y**x+z } . The 1st and the 2nd arguments are flipped.
r.call(3,2,5) #=> 14
```

## Contributing to procaine

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Akira Hayakawa. See LICENSE.txt for
further details.

