import Data.Time

flippable = all (`elem` "01689") . show

flip180 = read . map f . reverse . show
          where f '9' = '6'
                f '6' = '9'
                f  x  =  x

main = print $ length [ n | n <- [0..100000], flippable n, n == flip180 n ]
