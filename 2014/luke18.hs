import Data.Char
import Data.List
import Data.Function

main = do stuff <- readFile "luke18_data.txt"
          print $ head 
                $ maximumBy (compare `on` length)
                $ group
                $ sort
                $ map (sort . map toLower)
                $ lines stuff