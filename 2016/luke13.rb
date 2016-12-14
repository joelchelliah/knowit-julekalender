lights = Array.new(10000, Array.new(10000, false))

File.readlines('luke13_data.txt').each do |line|
  description = line.strip.split(" ")
  from, _, to = description[-3..-1]
  x0, y0      = from.split(",").map &:to_i
  x1, y1      = to.split(",").map &:to_i

  if description[1] == "on"
    (x0..x1).each { |x| lights[x] = lights[x].map.with_index { |y, i| y || (y0..y1).include?(i) } }
  elsif description[1] == "off"
    (x0..x1).each { |x| lights[x] = lights[x].map.with_index { |y, i| y && !(y0..y1).include?(i) } }
  else
    (x0..x1).each { |x| lights[x] = lights[x].map.with_index { |y, i| y ^ (y0..y1).include?(i) } }
  end
end

p lights.flatten.count { |l| l }
