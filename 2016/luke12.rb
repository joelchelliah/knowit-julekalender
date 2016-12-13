from_eng = Hash[('a'..'z').zip(1..26)]
from_dec = Hash[(0..13).zip(%w(0 I II III IV V VI VII VIII IX X XI XII XIII))]

decs = File.readlines('luke12_data.txt').first.strip.downcase.split(//)
  .select { |e| ('a'..'z').include? e }
  .map { |e| from_eng[e] }
  .map { |d| if d.odd? then [d.div(2) + 1, d.div(2)] else [d.div(2), d.div(2)] end }

p ((decs.map &:first) + (decs.map &:last).reverse)
  .map { |i| from_dec[i] }.join(",")
