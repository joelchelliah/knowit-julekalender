def dist_to_goal(from, through = [from, from])
  here_to_hole = Math.hypot(through[0][0] - from[0], through[0][1] - from[1])
  hole_to_goal = Math.hypot(GOAL[0] - through[1][0], GOAL[1] - through[1][1])
  here_to_hole + hole_to_goal
end

def count_steps(from, to)
  (to[0] - from[0]).abs + (to[1] - from[1]).abs
end

GOAL  = [99_999, 99_999]
pos   = [0,0]
steps = 0
holes = File.readlines('luke17_data.txt').inject([]) do |result, line|
  x0,y0,x1,y1 = line.strip.split("-").flat_map { |v| v.split(",") }.map &:to_i
  result     << [[x0, y0], [x1, y1]]
end

while pos != GOAL do
  first, *holes  = holes.sort_by { |hole| dist_to_goal(pos, hole) }

  if dist_to_goal(pos, first) < dist_to_goal(pos)
    steps += count_steps(pos, first[0])
    pos    = first[1]
  else
    steps += count_steps(pos, GOAL)
    pos    = GOAL
  end
end

p steps
