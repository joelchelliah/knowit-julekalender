import Data.List
import Data.Ord

main :: IO ()
main = do content <- lines <$> readFile "luke21_data.txt"
          let triangleA = (map read . words) <$> content
              triangleB = rotate triangleA
              triangleC = rotate triangleB
              rotate    = reverse . transpose

          print . maximumBy (comparing tail)
                $ map (\(corner, num) -> corner : show num)
                $ zip ['A'..'C']
                $ walk <$> [triangleA, triangleB, triangleC]

walk :: [[Int]] -> Int
walk [row] = maximum row
walk (row1:row2:rows) = walk $ updatedRow:rows
    where updatedRow  = update <$> zip [0..] row2
          update (i, n)
            | i == 0           = n + head row1
            | i == length row1 = n + last row1
            | otherwise        = n + max (row1 !! (i - 1)) (row1 !! i)
