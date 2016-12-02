require_relative 'timer'

# 1
Timer.watch(1) {

MOVES = [[1, 0], [-1, 0], [0, 1], [0, -1]]

def sum(x) x.to_s.chars.map(&:to_i).inject(:+) end

def search(pos, visited, d=0)
	if visited.include?(pos) then 0
	else
    visited << pos
		1 + MOVES.map { |move| [move[0] + pos[0], move[1] + pos[1]] }
             .select { |n_pos| sum(n_pos[0]) + sum(n_pos[1]) <= 19 }
             .reject { |n_pos| visited.include? n_pos }
             .inject(0) { |acc, n_pos| acc + search(n_pos, visited, d + 1) }
	end
end

positions = []
p search([0, 0], positions)
p positions
}