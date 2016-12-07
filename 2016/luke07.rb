p File.readlines('luke07_data.txt').inject([0,0]){ |res, line|
  _, m, _, dir = line.strip.split(/\s+/)
  res[0] += m.to_i if dir == "north"
  res[0] -= m.to_i if dir == "south"
  res[1] += m.to_i if dir == "west"
  res[1] -= m.to_i if dir == "east"
  res
}
