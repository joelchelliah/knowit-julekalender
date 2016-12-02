find x = find' (x-1) ""

find' x acc = if rem == 0 then rest else find' (rem - 1) rest
  where rem = div x 26
        rest= (['A'..'Z'] !! (mod x 26)):acc

main = print $ find 142453146368
