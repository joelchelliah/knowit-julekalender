require_relative 'timer'

# 1
Timer.watch {
MOVES = [[4,6],[6,8],[7,9],[4,8],[3,9,0],[],[1,7,0],[2,6],[1,3],[2,4]]

def paths(pos, d)
	return 1 if d == 10

	ps = 0
	MOVES[pos].each { |new_pos| ps += paths(new_pos, d + 1) }
	ps
end

p paths(1,1)

}
