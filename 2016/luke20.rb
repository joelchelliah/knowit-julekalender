digits = (0..9).to_a.reverse
puts digits.combination(5).inject(0) { |secret, left|
  right  = digits - left
  prod   = left.join.to_i * right.join.to_i
  secret = prod if prod > secret
  secret
}
