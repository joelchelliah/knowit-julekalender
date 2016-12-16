import Data.Char
import Math.NumberTheory.Powers.Squares
import Math.NumberTheory.Powers.Cubes

main :: IO ()
main = print . head
     $ [ x | x <- [100000..]
       , (== 43) . sum . map digitToInt . show $ x
       , isSquare x && (isCube x || x < 500000) || isCube x && x < 500000
       ]
