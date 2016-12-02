-- 11, 34, 42, 15, 25, 31, 54, 13, 32, 45, 35, 23, 43, 51, 21, 14, 41, 33, 52

mapTuple f (a1, a2) = (f a1, f a2)

coords = map (\row -> map (mapTuple read . splitAt 1 . show) row)
         [[34, 21, 32, 41, 25], [14, 42, 43, 14, 31], [54, 45, 52, 42, 23], [33, 15, 51, 31, 35], [21, 52, 33, 13, 23]]

navigate (x0, y0) = let (x , y ) = (x0 - 1, y0 - 1)
                        (x', y') = ((coords !! x) !! y)
                        rest     = if (x0, y0) == (x', y') then [] else navigate (x', y')
                    in foldl ((+).(*10)) 0 [x0, y0] : rest

main = print $ navigate (1, 1)
--main = print $ m2
