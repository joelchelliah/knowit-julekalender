ans = (6..999996).find do |i|
  s = i.to_s
  last = s[-1]
  init = s[0...-1]
  last == "6" && (last + init).to_i == 4 * i
end

puts ans
