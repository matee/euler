{-
    Project Euler: Problem #5

    2520 is the smallest number that can be divided by each of 
    the numbers from 1 to 10 without any remainder.
    What is the smallest positive number that is evenly divisible 
    by all of the numbers from 1 to 20?

    Answer: 232792560
-}


-- sub-optimal: there is no need to test divisibility 
--   by 6, 3, and 2 at the same time
divisible :: [Int] -> Int -> Bool
divisible xs n = all (\x -> n `mod` x == 0) xs


-- sub-optimal: the list could have better starting point
main :: IO ()
main = print $ head [x | x <- [2520,2522..], divisible [1..20] x]


