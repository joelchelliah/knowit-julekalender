count2s = length . filter (=='2') . show

count x y = foldl (+) 0 $ map count2s [x..y]

main = print [
              count 1 9,
              count 10 99,
              count 100 999
             ]
