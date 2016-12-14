resistances = (1..16).map { |m| [m, m**m] }

nums_and_pows = (2..15).inject([]) do |acc, i|
  nums_and_pow = resistances.combination(i).map do |combo|
    nums = combo.map(&:first)
    pow  = combo.map(&:last).inject(:*)
    [nums, pow]
  end
  acc += nums_and_pow.select { |pair| pair.last > 2.25e32 }
end

p nums_and_pows.map(&:first)
               .sort_by { |ns| ns.map { |n| (1..n).inject(:*) }.inject(:+) }
               .find    { |ns| ns.count.even? }
