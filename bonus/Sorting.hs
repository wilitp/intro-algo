module Sorting where

-- Removes first occurence of element
remove :: Eq a => a -> [a] -> [a]
remove _ [] = []
remove a (x:xs) = if a == x then xs else x : remove a xs

baseSort :: Ord a => ([a] -> a) -> [a] -> [a] 
baseSort _ [] = []
baseSort f (x:xs) = f (x:xs) : baseSort f (remove (f (x:xs)) (x:xs))

sort :: Ord a => [a] -> [a]
reverseSort :: Ord a => [a] -> [a]

sort = baseSort minimum
reverseSort = baseSort maximum

