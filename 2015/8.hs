mirp x = prim x && (prim . rev) x && rev x /= x
  where rev = read . reverse . show
        prim x = null [ n | n <- [2..x-1], mod x n == 0]

main = (print . length . filter mirp) [13..991]
