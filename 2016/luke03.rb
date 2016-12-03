likes, hates = {}, {}

File.readlines('luke03_data.txt').each do |line|
  relationship = line.strip.split(/\s+/)

  if relationship[0] == "friends"
    _, x, y  = relationship
    likes[x] = (likes[x] || []) << y
    likes[y] = (likes[y] || []) << x

  else
    x, _, y  = relationship
    hates[x] = (hates[x] || []) << y
  end
end

frenemies = {}
likes.each do |x, friends|
  frenemies[x] = 0
  friends.uniq.each do |y|
    frenemies[x] += 1 if hates[x].include?(y) && !hates[y].include?(x)
  end
end

p frenemies.max_by {|_, num| num }
