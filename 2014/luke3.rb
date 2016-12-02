t1 = Time.now

BDIMS = 10
BOARD = Array.new(BDIMS){Array.new(BDIMS){0}}
MOVES = [[-1, -2], [1, -2], [-2, -1], [2, -1], [-2, 1], [2, 1], [-1, 2], [1, 2]]

def valid?(x, y) x < BDIMS && x >= 0 && y < BDIMS && y >= 0 end

def same_color?(ox, oy, x, y) BOARD[oy][ox] == BOARD[y][x] end

def update_board(x,y) BOARD[y][x] = (BOARD[y][x] + 1) % 2 end

def next_move(ox, oy)
	moves = MOVES.map { |dx, dy| [ox + dx, oy + dy] }.select { |x, y| valid?(x, y) }
	moves.find { |x, y| same_color?(ox, oy, x, y) } || moves.last
end

cur_pos = [0,0]
num_blacks = 0
(1..200).each do
	old_pos = cur_pos
	cur_pos = next_move(*cur_pos)
	num_blacks += 2 * update_board(*old_pos) - 1
end

p num_blacks

t2 = Time.now
delta = t2 - t1
p delta