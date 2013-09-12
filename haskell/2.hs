fibs :: [Integer]
fibs = g (1,0) 
    where g (a,b) = b : g (a+b,a)

euler :: Integer
euler = sum . filter even . takeWhile (<4000000) $ fibs

main :: IO ()
main = print euler
