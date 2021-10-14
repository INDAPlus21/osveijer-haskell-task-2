module F1 where
import Data.Char
import Data.Function

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib' (n-2) 0 1
fib' 0 x y = x + y
fib' n x y = fib' (n-1) y (x+y)

isVowel c = c `elem` "aeiouy"

rovarsprak :: String -> String
rovarsprak [] = []
rovarsprak (x:xs) 
    | isVowel x = x:rovarsprak xs
    | otherwise = x:'o':x:rovarsprak xs

karpsravor :: String -> String 
karpsravor [] = []
karpsravor (x:xs)
    | isVowel x = x:karpsravor xs
    | otherwise = x:karpsravor(tail(tail xs))

isNotAlpha c = not(isAlpha c)

splitWords   :: String -> [String]
splitWords s =  case dropWhile isNotAlpha s of
                      "" -> []
                      s' -> w : splitWords s''
                            where (w, s'') = break isNotAlpha s'

totalLength :: [String] -> Int 
totalLength [] = 0
totalLength (x:xs) = length x + totalLength xs

averageLength :: [String] -> Float 
averageLength x = fromIntegral(totalLength x)/fromIntegral(length x)

medellangd :: String -> Float 
medellangd x = averageLength( splitWords x )

removeElement _ [] = []
removeElement x (y:ys)  | x == y = ys
                        | otherwise = y : removeElement x ys

forsta [] [] = []
forsta [] y = forsta y y
forsta (x:xs) y = x : andra xs (removeElement x y)

andra [] [] = []
andra [] y = forsta y y
andra (x:xs) y = forsta xs y

skyffla [] = []
skyffla x = forsta x x