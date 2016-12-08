import Data.Maybe

main :: IO ()
main = lines <$> readFile "luke08_data.txt" >>= (print . play . map read)

play :: [Integer] -> Int
play rolls = play' rolls 1 0 []
  where play' (roll:rest) player laddersUsed positions =
          let currentPos  = fromMaybe 1 (lookup player positions)
              nextPos     = if currentPos + roll > 90 then currentPos else currentPos + roll
              nextPlayer  = player `mod` 1337 + 1
              updatePos p = (player, p) : filter ((player /=) . fst) positions
          in  if nextPos == 90
              then player * laddersUsed
              else case lookup nextPos ladders of
            Just newPos -> play' rest nextPlayer (laddersUsed + 1) (updatePos newPos )
            _           -> play' rest nextPlayer  laddersUsed      (updatePos nextPos)

ladders :: [(Integer, Integer)]
ladders = [(3,17), (8,10), (15,44), (22,5), (39,56), (49,75), (62,45), (64,19), (65,73), (80,12), (87,79)]
