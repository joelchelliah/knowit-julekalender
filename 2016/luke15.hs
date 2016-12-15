import Data.List

main :: IO ()
main = print . length $ lookAndSay 50 "1111321112321111"

lookAndSay :: Int -> String -> String
lookAndSay 0 nums = nums
lookAndSay i nums = lookAndSay (i-1) expanded
   where expand n = show (length n) ++ [head n]
         expanded = concatMap expand $ group nums
