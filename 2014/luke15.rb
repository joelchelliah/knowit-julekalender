t1 = Time.now

p [*(10..99)].repeated_permutation(2).select { |x,y| (x * y).to_s.chars.sort == "#{x}#{y}".chars.sort && x * y % 100 != 0 }.size / 2

p (Time.now - t1)
