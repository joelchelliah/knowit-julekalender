ladders = { 3 => 17, 8 => 10, 15 => 44, 22 => 5, 39 => 56, 49 => 75, 62 => 45, 64 => 19, 65 => 73, 80 => 12, 87 => 79 }

File.readlines('luke08_data.txt').inject([1, 0, {}]) { |res, line|
  player, num_ladders_used, positions = res
  pos  = (positions[player] || 1) + line.strip.to_i

  if ladders[pos]
    pos = ladders[pos]
    num_ladders_used += 1
  end

  if pos == 90
    p player * num_ladders_used
    break
  end

  positions[player] = pos if pos <= 90
  player = player % 1337 + 1

  [player, num_ladders_used, positions]
}
