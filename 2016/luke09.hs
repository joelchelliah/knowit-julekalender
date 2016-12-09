import Data.List.Split
import qualified Data.Map as M

main :: IO ()
main = do transactions <- lines <$> readFile "luke09_data.txt"
          print . length . M.filter (>10) . balances $ splitOn "," <$> transactions

balances :: [[String]] -> M.Map String Integer
balances = foldl move M.empty
    where move acc [from, to, amountString] =
            let amount = read amountString :: Integer
                newAcc = M.insertWith (+) to amount acc
            in  if from == "None"
                then newAcc
                else M.insertWith (+) from (-amount) newAcc
