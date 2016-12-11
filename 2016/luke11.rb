require 'date'

overflow = 2_147_483_647
seconds = overflow % 90000

time = DateTime.new(1970, 1, 1).next_day((overflow - seconds) / 90000).to_time + seconds

p time.getlocal("+00:00")
