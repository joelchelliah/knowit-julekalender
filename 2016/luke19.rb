puts File.readlines('luke19_data.txt').map { |l| l.strip.tr('13579', ' ') }
