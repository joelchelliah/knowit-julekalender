import Criterion.Main
--import Data.List

moves = [[4,6],[6,8],[7,9],[4,8],[3,9,0],[],[1,7,0],[2,6],[1,3],[2,4]]

paths pos step = if step == 10 then 1
                 else foldl recSum 0 (moves !! pos)
                      where recSum acc new_pos = acc + paths new_pos (step + 1)

--main = print (paths 1 1)

ans pos = paths pos 1
main = defaultMain [ bgroup "test" [ bench "test" $ whnf ans 1 ] ]

