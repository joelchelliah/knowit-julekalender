to_dec = Hash[%w(0 I II III IV V VI VII VIII IX X XI XII XIII).zip((0..13))]
to_eng = Hash[(1..26).zip(('a'..'z'))]

decs = File.readlines('luke05_data.txt').first
  .strip[1..-2].tr(',', '').split(/\s+/)
  .map { |n| to_dec[n] }

p decs[0...decs.size/2]
  .zip(decs.reverse[0...decs.size/2])
  .map { |n| to_eng[n.inject(:+)] }.join
