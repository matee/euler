{-
    Project Euler: Problem #3

    The prime factors of 13195 are 5, 7, 13 and 29.
    What is the largest prime factor of the number 600851475143 ?

    Answer: 6857

-}


{-
  This is the real Sieve of Eratosthenes algorithm
  according to: http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
-}

import qualified Data.Map as Map

primes :: Integral a => [a]
primes = 2 : sieve [3,5..]

sieve :: Integral a => [a] -> [a]
sieve xs = sieve' xs Map.empty
    where
        sieve' []     _     = []
        sieve' (x:xs) table =
            case Map.lookup x table of
                Nothing -> x : sieve' xs (Map.insert (x*x) [x] table)
                Just facts -> sieve' xs (foldl reinsert (Map.delete x table) facts)
                where
                    reinsert table prime = Map.insertWith (++) (x+prime) [prime] table


-- find all prime factors of a number
primeFactors :: Integral a => a -> [a]
primeFactors a = filter (\p -> a `mod` p == 0)
               . takeWhile (\p -> p*p <= a) 
               $ primes

main :: IO ()
main = print . last . primeFactors $ (600851475143 :: Integer)

