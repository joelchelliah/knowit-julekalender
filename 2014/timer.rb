class Timer

	def self.watch(name="", &b)
		puts "------------- #{name} -------------"
		print " Result:  "
		t1 = Time.now
		yield
		puts " Time:    #{Time.now - t1} seconds"
		puts
	end
end