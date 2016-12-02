require_relative 'timer'

# 1
Timer.watch {

puts File.readlines('luke18_data.txt').inject({}) { |hash, line|
    	key       = line.strip.downcase.chars.sort.join
    	hash[key] = (hash[key] || 0) + 1
        hash
     }.max_by { |k, v| v }.first

}

# 2
Timer.watch {

puts IO.read('luke18_data.txt')
       .split("\n")
       .map { |w| w.downcase.chars.sort.join }
       .group_by(&:to_s)
       .values
       .max_by(&:size)
       .first

}