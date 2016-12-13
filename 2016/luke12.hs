import Data.Maybe
import Data.Char

main :: IO ()
main = do content <- lines <$> readFile "luke12_data.txt"
          let decs   = fromEng <$> (filter (`elem` ['a'..'z']) . map toLower $ head content)
              pair d = let half = d `div` 2
                       in if odd d then (half + 1, half) else (half, half)
              paired = pair <$> decs
              coded  = (fst <$> paired) ++ reverse (snd <$> paired)

          print $ fromDec <$> coded

fromEng :: Char -> Integer
fromEng n = fromJust (lookup n (zip ['a'..'z'] [1..26]))

fromDec :: Integer -> String
fromDec d = fromMaybe "0" (lookup d (zip [1..13] ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII", "XIII"]))
