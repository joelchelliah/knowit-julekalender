require 'prime'

t1 = Time.now

p [*(1..9)].permutation.map { |n| n.join.to_i.prime_division.last[0] }.min

p (Time.now - t1)
