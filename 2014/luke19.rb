require_relative 'timer'

Timer.watch(2) {

s = IO.read('luke19_data.txt').downcase.chars

puts (1..10).inject("") { |acc, size| s.each_cons(size).find { |i| i == i.reverse } || acc }.join

}
