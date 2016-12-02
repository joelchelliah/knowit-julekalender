p File.readlines('luke4_data.txt').inject([]) { |res, line|
	s = line.strip.split(/\s+/) if line.include? ".12."
	res << [s[1], s[3].sub(",", ".").to_f] if s
	res
}.sort_by { |x| x.last }.first