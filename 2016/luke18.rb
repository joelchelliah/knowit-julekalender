diff  = Time.new(1,1,1,20,8,8) - Time.new(1,1,1,1,11,11)

hh = diff.div(60 * 60)
mm = diff.div(60) - hh * 60
ss = diff - hh * 60 * 60 - mm * 60

p "#{hh}:#{mm}:#{ss}"
