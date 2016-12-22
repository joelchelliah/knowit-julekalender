import Data.List.Utils
import Text.Regex.PCRE
import Data.List.Split

main :: IO ()
main = do content <- replace "\n" "" <$> readFile "luke22_data.txt"
          let pattern = "(\\[\\-?[0-9],\\-?[0-9],\\-?[0-9],\\-?[0-9]\\],?)+"
              results = content =~ pattern :: AllTextMatches [] String
              matches = getAllTextMatches results
              groups  = splitOn "#" <$> replace "],[" "]#[" <$> matches
              regions = buildRegion <$> groups
              toStr r = if r then "true" else "false"

          print . replace " " ", " . unwords $ toStr <$> insideRegion <$> zip groups regions
          --print $ regions

insideRegion :: ([String], [Int]) -> Bool
insideRegion (rects, [x, y, x', y']) = foldl inside True rects
  where inside acc rect =
          let [x0, y0, x1, y1] = getCoords rect
          in  acc && x0 >= x && y0 >= y && x1 <= x' && y1 <= y'

buildRegion :: [String] -> [Int]
buildRegion (h:t) = buildRegion' x0 y0 x1 y1 t
  where [x0, y0, x1, y1] = getCoords h
        buildRegion' x0 y0 x1 y1 []    = [x0, y0, x1, y1]
        buildRegion' x  y  x' y' (h:t) = buildRegion' newX newY newX' newY' t
          where [x0, y0, x1, y1] = getCoords h
                (newX , newY ) = if x0 < x  || y0 < y  then (x0, y0) else (x , y )
                (newX', newY') = if x1 > x' || y1 > y' then (x1, y1) else (x', y')

getCoords :: String -> [Int]
getCoords p = (map read $ splitOn "," . tail . init $ p) :: [Int]
