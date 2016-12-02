import Data.List

primes = sieve [2..] where sieve (p:xs) = p : sieve [x|x <- xs, x `mod` p > 0]

main = print $ take 5 primes