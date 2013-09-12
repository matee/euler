{-
    Project Euler: Problem #4

    A palindromic number reads the same both ways. The largest palindrome
    made from the product of two 2-digit numbers is 9009 = 91 × 99.
    Find the largest palindrome made from the product of two 3-digit numbers.

    Answer: 906609
-}

import Data.List (find)
import qualified Data.Set as Set (Set, empty, insert, toDescList)

isPalindrome :: (Integral a, Show a) => a -> Bool
isPalindrome x = let string = show x
                 in string == reverse string

-- using Set guarantees no duplicates
products :: Int -> Int -> Set.Set Int
products 0 0 = Set.empty
products x 1 = Set.insert x (products (x-1) (x-1))
products x y = Set.insert (x * y) (products x (y-1))

-- Set.toDescList converts the Set to a list in descending order
-- This is faster than sorting the list afterwards
main :: IO ()
main = print . find isPalindrome . Set.toDescList $ products 999 999

