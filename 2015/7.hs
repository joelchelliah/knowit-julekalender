main = print $ sum $ filter (\x -> mod x 7 == 0 && mod (read $ reverse $ show x) 7 == 0) $ [7..1000]
