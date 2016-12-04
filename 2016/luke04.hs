main :: IO ()
main = print . last $ play [1..1337]

play :: [Integer] -> [Integer]
play list = play' 1 list []
  where play' _ [] acc = let out = reverse acc
                         in if any hasSeven out
                            then play' 1 out []
                            else out
        play' c (h:t) acc = if hasSeven h
                            then play' (c+1) t (c:acc)
                            else play' c t (h:acc)
        hasSeven e = (e `mod` 7 == 0) || '7' `elem` show e
