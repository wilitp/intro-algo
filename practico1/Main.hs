module Practico1 where
--a 
f x = 5*x

--b
duplica a = a + a

--c
por2 = (2*)

--d
multiplicar zz tt = zz*tt

-- Calcula un promedio
promedio :: Fractional a => a -> a -> a
promedio a b = (a+b)/2

rangoPrecio :: Int -> String
rangoPrecio x | x < 0 = "No puede ser"
              | x < 2000 = "Muy barato"
              | x >= 2000 && x < 5000 = "Epa"
              | x >= 5000 = "Carardo"


absoluto :: Int -> Int
absoluto x = if x < 0 then (-x) else x

absoluto' x | x < 0 = -x
            | otherwise = x


esMultiplo2 :: Int -> Bool
esMultiplo2 x = x `mod` 2 == 0

-- 20
esBisiesto :: Int -> Bool
esBisiesto x = x `mod` 400 == 0 || (x `mod` 4 == 0 && x `mod` 100 /= 0) 
-- 21
dispersion :: (Ord a, Num a) => a -> a -> a -> a
dispersion x y z = ((x `max` y) `max` z) - ((x `min` y ) `min` z) 

-- 22
celsiusToFahr :: (Num a, Fractional a) => a -> a
celsiusToFahr x = x * 1.8 + 32

-- 23
fahrToCelsius :: (Num a, Fractional a, Ord a) => a -> a
fahrToCelsius x = (x - 32) / 1.8

-- 24
haceFrioF :: (Num a, Fractional a, Ord a) => a -> Bool

haceFrioF x = fahrToCelsius x < 8


-- 25.a
segundo3 :: Num a => (a,a,a) -> a
segundo3 (_, s,_) = s

-- 25.b
-- No me copies este, lo piden con guardas
ordena :: Ord a => (a,a) -> (a,a)
ordena (x, y) = if x > y then (x, y) else (y, x)

-- 25.c
rangoParam :: (Ord a, Num a) => a -> (a,a) -> String
rangoParam x (mi,ma) | x <= 0 = "Esto no puede ser"
                     | x < mi = "Muy barato"
                     | mi <= x && x <= ma = "Hay que verlo"  
                     | ma <= x = "Muy caro"
