require_relative 'timer'

# 1
Timer.watch {

p (18..10000).find { |n| (2**n).to_s.include? "472047" }

}
