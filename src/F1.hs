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

varannan :: [a] -> [a]
varannan [] = []
varannan (x:y:xs) = x: varannan xs
varannan (x:xs) = [x]

skyffla :: [a] -> [a]
skyffla [] = []
skyffla (x:xs) = concat (varannan (x:xs) : [skyffla (varannan xs)])