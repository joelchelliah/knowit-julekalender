def has_seven(n)
  n%7 == 0 || n.to_s.include?("7")
end

series = (1..1337)

while series.any? { |n| has_seven(n) } do
  c = 0
  series = series.map do |n|
    if has_seven(n)
      c += 1
    else
      n
    end
  end
end

p series.last
