import Data.List

modTest x y = x * y `mod` 100 /= 0
numTest x y = (sort $ show x ++ show y) == (sort . show $ x * y)

n = foldl sumOuter 0 [11..99]
    where sumOuter acc x = foldl sumInner acc [x..99]
                           where sumInner acc y = if modTest x y && numTest x y then acc + 1 else acc

main = print n