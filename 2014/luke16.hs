import Criterion.Main
import Data.List

n x = (find ( isInfixOf "472047" . show . (2^) ) [1..])

main = defaultMain [
        bgroup "n" [ bench "n" $ whnf n 1 ]
       ]
