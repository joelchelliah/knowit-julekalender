main :: IO ()
main = print . head $ foldl (\(x:y:z:rest) _ -> (x+y+z):x:y:z:rest) [4,2,1] [4..250]
