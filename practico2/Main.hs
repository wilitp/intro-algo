module Practico2 where 
-- 3.a
soloPares :: [Int] -> [Int]
soloPares [] = []
-- solucion no recursiva
-- soloPares xs = [x | x <- xs, even x ]
-- solucion recursiva
soloPares (x:xs) | even x = x:soloPares xs
                 | otherwise = soloPares xs

-- Para [1,2,3] equivale a 2 : []

-- solucion con if else
-- soloPares (x:xs) = if even x then x:soloPares xs else soloPares xs

-- 3.b
mayoresQue10 :: [Int] -> [Int]
mayoresQue10 = mayoresQue 10

-- 3.c
mayoresQue :: Int -> [Int] -> [Int]
-- 
mayoresQue _ [] = []
mayoresQue y (x:xs) | x > y = x:mayoresQue y xs
                    | otherwise = mayoresQue y xs

-- 4
-- Aplica una función a una lista
-- Esta función ya está definida en el Prelude, se llama map
miMap :: (a -> b) -> [a] -> [b]
miMap _ [] = []
miMap f (x:xs) = f x:miMap f xs

-- 4.a
sumar1 :: [Int] -> [Int]
sumar1 = miMap (+1)

-- 4.b
duplica :: [Int] -> [Int]
duplica = miMap(*2)

-- 4.c
multiplica :: Int -> [Int] -> [Int]
multiplica x = miMap(*x)

-- 5
-- Funcion de tipo fold genérica
validate :: (a -> Bool) -> [a] -> Bool
validate _ [] = True
validate f (x:xs) | f x = validate f xs
                  | otherwise = False

-- 5.a
menoresQue10 :: [Int] -> Bool
menoresQue10 = validate (<10)

-- 5.b
noHay0 :: [Int] -> Bool
noHay0 = validate (/=0)
hay0 xs = not (noHay0 xs)

-- 5.c
sum1 :: [Int] -> Int -- sum ya existe en Prelude
sum1 [] = 0
sum1 (x:xs) = x + sum xs
