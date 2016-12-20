import Data.List
import Data.Char

main :: IO ()
main = print $ foldl findSecret 0 combos

findSecret :: Int -> [Int] -> Int
findSecret secret left = if prod > secret then prod else secret
           where prod  = product $ toNum <$> [left, right]
                 toNum = read . map intToDigit
                 right = digits \\ left

combos :: [[Int]]
combos = nub . map (sortBy (flip compare))
       $ filter ((5==) . length . nub)
       $ mapM (const digits) ([1..5] :: [Int])

digits :: [Int]
digits = [9,8..0]
