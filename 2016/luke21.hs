import Data.List
import Data.Ord

main :: IO ()
main = do content <- lines <$> readFile "luke21_data.txt"
          let triangleA = (map read . words) <$> content
              triangleC = rotate triangleA
              triangleB = rotate triangleC

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

rotate :: [[Int]] -> [[Int]]
rotate triangle = findRow <$> zip [0..] triangle
      where findRow (i, row) = findColumn i <$> (fst <$> zip [0..] row)
            findColumn i j   = (triangle !! (length triangle - 1 - j)) !! (i - j)
