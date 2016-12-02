main :: IO ()
main = print . show . sum . takeWhile (<4000000000) . filter even
     $ fibs 1 2
 where fibs a b = b : fibs b (a + b)
