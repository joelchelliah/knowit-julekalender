balances = File.readlines('luke09_data.txt').inject({}) { |res, line|
  from, to, amount = line.strip.split ","

  res[to] = (res[to] || 0) + amount.to_i
  res[from] -= amount.to_i unless from == "None"
  res
}

p balances.select { |_, v| v > 10 }.count
