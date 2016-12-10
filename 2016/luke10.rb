STATUS = { wizard: 1, warrior: 1, priest: 1, thief: 1 }

def alive?(a)
  STATUS[a] == 1
end

def dead?(a)
  STATUS[a] == 0
end

def resurrect!(a)
    STATUS[a] = 1
end

def kill!(a)
  STATUS[a] = 0
end

def rot!()
  STATUS.keys.each { |a| STATUS.delete a if dead?(a) }
end

def num_alive()
  %i(wizard warrior priest thief).count &method(:alive?)
end


can_resurrect = true
new_room = true
goblins = 0
survivors = 17

(1..100).each do |room|
  if new_room
    goblins = room
    can_resurrect = true
  end

  goblins -= 1  if alive?(:thief)
  goblins -= 10 if alive?(:wizard)
  goblins -= 1  if alive?(:warrior)

  if alive? :priest and can_resurrect
    if dead? :warrior
      resurrect! :warrior
      can_resurrect = false
    elsif dead? :wizard
      resurrect! :wizard
      can_resurrect = false
    end
  end

  if alive? :thief and num_alive == 1
    survivors += goblins
    new_room = true
    next
  end

  if goblins >= 10 * num_alive
    if alive? :warrior
      kill! :warrior
    elsif alive? :wizard
      kill! :wizard
    elsif alive? :priest
      kill! :priest
    end
  end

  if goblins > 0 and num_alive > 0
    new_room = false
    redo
  end

  rot!
  new_room = true
end

p survivors + num_alive
