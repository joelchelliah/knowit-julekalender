main :: IO ()
main = print $ title 90101894
  where title 0 = ""
        title n = title (n `div` 26) ++ [char n]
        char  n = ['A'..'Z'] !! (n `rem` 26 - 1)
