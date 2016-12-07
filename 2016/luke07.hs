main :: IO ()
main = do desc <- lines <$> readFile "luke07_data.txt"
          print . direction $ words <$> desc

direction :: [[String]] -> (Int, Int)
direction = foldl add (0,0)
    where add (n,w) [_, m, _, dir] = case dir of
            "north" -> (n + read m, w)
            "south" -> (n - read m, w)
            "west"  -> (n, w + read m)
            _       -> (n, w - read m)
