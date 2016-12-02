
palindrome x = show x == (reverse . show) x

toOct 0 = 0
toOct x = let (a,b) = quotRem x 8
          in b + 10 * toOct a

main = print . length 
  	 $ filter (palindrome . toOct)
  	 $ filter palindrome [1..1000000]
