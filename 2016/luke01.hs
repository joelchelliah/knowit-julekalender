main :: IO ()
main = print . head
     $ [ x | x <- show <$> [6..]
       , last x == '6'
       , last x : init x == show (4 * read x)
       ]
