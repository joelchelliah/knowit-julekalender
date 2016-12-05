import Data.Maybe
import Data.List.Split

main :: IO ()
main = do content <- lines <$> readFile "luke05_data.txt"
          let decs = toDec <$> (splitOn ", " . init . tail . head $ content)
              half = take $ length decs `div` 2
          print $ toEng <$> zipWith (+) (half decs) (half $ reverse decs)

toDec :: String -> Integer
toDec n = fromMaybe 0 (lookup n (zip ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII", "XIII"] [1..13]))

toEng :: Integer -> Char
toEng n = fromJust (lookup n (zip [1..26] ['a'..'z']))
