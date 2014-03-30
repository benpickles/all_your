# AllYour

[![Build Status](https://travis-ci.org/benpickles/all_your.svg?branch=master)](https://travis-ci.org/benpickles/all_your)

A little experiment to see how many characters could be used in a link shortener's path. I think it ends up being "base 78":

```ruby
AllYour.base(78).decode('/~path/2/nowhere')
# => 288757223154835410767515610539
```

Binary encoding also fell out for free:

```ruby
AllYour.base(:binary).encode(42)
# => "101010"
```
