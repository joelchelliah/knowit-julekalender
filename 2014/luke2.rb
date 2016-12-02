require 'prime'


def prime_stuff(n)
	(971111111..979999999).find do |m|
		pairs = m.to_s.split('').each_cons(2).to_a
		m if pairs.uniq.size == n-1 && pairs.all? { |p| Prime.prime?(p.join.to_i) }
	end
end
p prime_stuff(9)

p Prime.first 50
