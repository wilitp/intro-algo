```haskell
module Practico2 where 
import Control.Exception

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
--
noHay0 :: [Int] -> Bool
noHay0 = validate (/=0)
hay0 xs = not (noHay0 xs)

-- 5.c
sum1 :: [Int] -> Int -- sum ya existe en Prelude
sum1 [] = 0
sum1 (x:xs) = x + sum xs

-- 6 zip ya existe
miZip :: [a] -> [b] -> [(a, b)] 
miZip [] (x:xs) = []
miZip (x:xs) [] = []
miZip (x:xs) (y:ys) = (x, y):miZip xs ys

-- 7
-- No es lo que pide ya se
miUnzip :: [(a,b)] -> ([a], [b])
primero (a, b) = a
segundo (a, b) = b
miUnzip [] = ([], [])
miUnzip ((x, y):xs) = (x : primero (miUnzip xs),y : segundo (miUnzip xs))

-- Ahora si
apellidos :: [(String, String, Int)] -> [String]
apellidos [] = []
apellidos ((_, n, _):xs) = n : apellidos xs

-- 8
-- Operador # (length)
miLength :: [a] -> Int
miLength [] = 0
miLength (x:xs) = 1 + miLength xs 

-- Operador ! (!!)
-- data IndexError = IndexOutOfBounds
-- instance Exception IndexError
tomarPorIndice :: [a] -> Int -> a 
tomarPorIndice [] _ = error "El índice es demasiado largo."
tomarPorIndice (x:xs) i = if i == 0 then x else xs `tomarPorIndice` (i-1)  

-- Operador pegar por derecha
-- No se si era la idea
pegarDerecha :: [a] -> a -> [a]
pegarDerecha [] x = [x]
pegarDerecha (x:xs) y = x:pegarDerecha xs y


-- Operador take
miTake :: Int -> [a] -> [a]
miTake 0 _ = []
miTake _ [] = []
miTake n (x:xs) = x:miTake (n-1) xs 

-- Operador drop
miDrop :: Int -> [a] -> [a]
miDrop 0 xs = xs
miDrop _ [] = []
miDrop n (x:xs) = miDrop (n-1) xs

-- Operador ++
miConcat :: [a] -> [a] -> [a]
miConcat [] ys = ys
miConcat xs ys = miConcat (miTake (miLength xs -1) xs) (miDrop (miLength xs - 1) xs `tomarPorIndice` 0 : ys)

-- 9
-- Esta función ya existe, se llama filter
miFilter :: (a -> Bool) -> [a] -> [a]
miFilter _ [] = []
miFilter f (x:xs) = if f x then x:miFilter f xs else miFilter f xs

--9.a
maximo :: [Int] -> Int
maximo [x] = x
maximo (x:xs) | x > head xs = maximo (x : tail xs)
              | otherwise = maximo xs

-- 9.b 
sumaPares :: [(Int, Int)] -> Int
sumaPares [] = 0
sumaPares ((x, y):xs) = x + y + sumaPares xs

-- 9.c uso función genérica definida antes
todos0y1 :: [Int] -> Bool
todos0y1 xs = validate (== 0) xs || validate (==1) xs

-- 9.d uso función genérica definida antes
quitar0s :: [Int] -> [Int]
quitar0s = miFilter (/=0)

-- 9.e
ultimo :: [a] -> a
ultimo [] = error "Empty list"
ultimo [x] = x
ultimo (x:xs) = ultimo xs

-- 9.f 
repetir :: (Num a, Ord a) => a -> a -> [a]
repetir 0 _ = []
repetir n x | n < 0 = error "Repeating ammount has to be greater than 0"
            | otherwise = x:repetir (n-1) x

-- 9.g
-- La función miConcat fue definida en el ejercicio 8

-- 9.h esta función ya existe, se llama reverse
rev :: [a] -> [a]
rev [] = []
rev [x] = [x]
rev (x:xs) = ultimo (x:xs) : miTake (miLength (x:xs) - 1) (x:xs)
```
