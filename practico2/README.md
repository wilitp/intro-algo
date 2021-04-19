Para ejercicios 1-9 ver [Práctico 1](https://github.com/wilitp/intro-algo/tree/main/practico2/Main.hs)

## 10
**.a Demostrar sum(sumar1.xs) = sum(xs) + #xs**
sum [] = 0
sum (x:xs) = x + sum xs

sumar1 [] = []
sumar1 (x:xs) = (x + 1) : sumar1 xs

\# [] = 0
\# (x:xs) = 1 + \# xs 

**Case base**

sum(sumar1 []) = sum [] + #[]

sum([]) = 0 + 0 (Por los casos base de #, sum y sumar 1)

0 = 0

**Hipótesis inductiva**

sum(sumar1 xs) = sum xs + #xs

**Caso inductivo**

sum(sumar1[x:xs]) = sum(x:xs) + #(x:xs)
sum(sumar1[x:xs]) = x + sum xs  + 1 + # xs
sum(sumar1[x:xs]) = x + 1 + sum xs + # xs
sum(sumar1[x:xs]) = x + 1 + sum(sumar1 xs)
sum(sumar1[x:xs]) = sum((x + 1) + sumar1 xs)
sum(sumar1[x:xs]) = sum((sumar1 x:xs)

**.b Demostrar sum(duplica xs) = 2 * sum xs**

sum [] = 0
sum (x:xs) = x + sum xs

duplica [] = []
duplica (x:xs) = (2 * x):(duplica xs)

**Caso base**

sum(duplica []) = 


## 13 Demostrar soloPares(xs ++ ys) = soloPares xs ++ soloPares ys

soloPares [] = []
soloPares (x:xs) | even x = x:soloPares xs
                 | otherwise = soloPares xs

**Caso base**
soloPares([] ++ []) = soloPares [] ++ soloPares []
soloPares([]) = [] ++ []
[] = []

++ :: [a] -> [a] -> [a]
++ [] ys = ys
++ (x:xs) ys = x : xs ++ ys

**Hipótesis inductiva**

soloPares(xs ++ ys) = soloPares xs ++ soloPares ys

**Caso inductivo**

_Dado que x e y son pares_

soloPares(x:xs ++ y:ys) = soloPares x:xs ++ soloPares y:ys

soloPares(x:xs ++ y:ys) = x:(soloPares xs) ++ y:(soloPares ys)

soloPares(x:xs ++ y:ys) = x:(soloPares xs ++ y:soloPares ys)

soloPares(x:(xs ++ y:ys)) = x:(soloPares xs ++ y:soloPares ys)

x:soloPares(xs ++ y:ys)) = x:(soloPares xs ++ soloPares y:ys)

x:soloPares(xs ++ y:ys)) = x:(soloPares xs ++ y:ys)


_Dado que x es par e y es impar_

soloPares(x:xs ++ y:ys) = soloPares x:xs ++ soloPares y:ys

soloPares(x:xs ++ y:ys) = x:(soloPares xs) ++ (soloPares ys)

soloPares(x:xs ++ y:ys) = x:(soloPares xs ++ soloPares ys)

soloPares(x:xs ++ y:ys) = x:(soloPares (xs ++ ys) -- hipótesis

soloPares(x:xs ++ y:ys) = (soloPares x(xs ++ ys)


_Dado que x es impar e y es par_ -- TODO

soloPares(x:xs ++ y:ys) = soloPares x:xs ++ soloPares y:ys

soloPares(x:xs ++ y:ys) = soloPares xs ++ y:(soloPares ys)

soloPares(xs ++ y:ys) = soloPares xs ++ soloPares y:ys


_Dado que x e y son impares_ -- TODO

soloPares(x:xs ++ y:ys) = soloPares x:xs ++ soloPares y:ys

soloPares(x:xs ++ y:ys) = soloPares xs ++ soloPares y:ys

soloPares(xs ++ y:ys) = soloPares(xs ++ ys)

soloPares(xs ++ ys) = soloPares(xs ++ ys)

