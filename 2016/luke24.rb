def title(n, msg = "")
  return msg if n == 0
  title(n.div(26), ('A'..'Z').to_a[n % 26 - 1] + msg)
end

puts title(90101894)
