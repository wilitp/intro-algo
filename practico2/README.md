Para ejercicios 1-9 ver [Práctico 1](https://github.com/wilitp/intro-algo/tree/main/practico2/Main.hs)

## 10
**.a Demostrar sum(sumar1 xs) = sum xs + #xs**
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
sum(sumar1[x:xs]) = x + sum xs + 1 + # xs
sum(sumar1[x:xs]) = x + 1 + sum xs + # xs
sum(sumar1[x:xs]) = (x + 1) + sum(sumar1 xs) -- Hipótesis inductiva
sum(sumar1[x:xs]) = sum((x + 1) : sumar1 xs)
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

**Si x es par:**

soloPares(x:xs ++ ys) = soloPares x:xs ++ soloPares ys

soloPares(x:(xs ++ ys)) = soloPares x:xs ++ soloPares ys

{Definición recursiva de ++}

x:soloPares((xs ++ ys)) = soloPares x:xs ++ soloPares ys

{Definición recursiva de soloPares}

x:soloPares((xs ++ ys)) = x:soloPares xs ++ soloPares ys

{Definición recursiva de soloPares}

x:soloPares((xs ++ ys)) = x:(soloPares xs ++ soloPares ys)

{Definición recursiva de ++}

x:soloPares((xs ++ ys)) = x:(soloPares(xs ++ ys))

{Hipótesis inductiva}

{Queda demostrado por reflexividad del igual}


**Si x es impar**

soloPares(x:xs ++ ys) = soloPares x:xs ++ soloPares ys

soloPares(x:xs ++ ys) = soloPares xs ++ soloPares ys

{Definición recursiva de soloPares}

soloPares(x:(xs ++ ys)) = soloPares xs ++ soloPares ys

{Definición recursiva de ++}

soloPares(xs ++ ys) = soloPares xs ++ soloPares ys

{Definición recursiva de soloPares}

soloPares(xs ++ ys) = soloPares(xs ++ ys)

{Hipótesis inductiva}

{Queda demostrado por reflexividad del igual}


# 15 \#(repetir n x) = n

repetir 0 x = []
repetir n x = x:repetir (n - 1) x 

\# [] = 0
\# (x:xs) = 1 + \# xs 

**Caso Base**

\#(repetir 0 x) = 0

\#([]) = 0

{Por caso base de repetir}

0 = 0

{Por caso base de \#}
{Queda demostrado por reflexividad de la suma}

**Hipótesis**

\#(repetir k x) = k

**Caso inductivo**

\#(repetir (k + 1) x) = k + 1

\#(x:repetir k x) = k + 1

1 + \#(repetir k x) = k + 1

1 + k = k + 1

1 + k = k + 1

# 16 concat(xs ++ ys) = concat xs ++ concat ys 

concat [] = []
concat (xs:xss) = xs ++ concat xss

++ [] ys = ys
++ (x:xs) ys = x:(xs ++ ys)

**Caso base**

concat([] ++ ys) = concat [] ++ concat ys

[] ++ concat ys = [] ++ concat ys

concat ys = concat ys

**Hipótesis inductiva**

concat(xs ++ ys) = concat (xs) ++ concat ys

**Caso inductivo**

concat(x:xs ++ ys) = concat (x:xs) ++ concat ys

concat(x:(xs ++ ys)) = concat (x:xs) ++ concat ys

x ++ concat(xs ++ ys) = concat (x:xs) ++ concat ys

x ++ concat(xs ++ ys) = x ++ concat (xs) ++ concat ys

x ++ concat(xs ++ ys) = x ++ concat (xs ++ ys)

{Hipótesis inductiva}

# 17 rev(xs ++ ys) = rev ys ++ rev xs

rev [] = [] 
rev (x:xs) = xs ++ [x]

++ [] ys = ys
++ xs [] = xs
++ (x:xs) ys = x:(xs ++ ys)

**Caso base**

rev([] ++ ys) = rev ys ++ rev []

rev([] ++ ys) = rev ys ++ []

rev(ys) = rev ys

**Hipotesis inductiva**

rev(xs ++ ys) = rev ys ++ rev xs

**Caso inductivo**

rev(x:xs ++ ys) = rev ys ++ rev x:xs

rev(x:xs ++ ys) = rev ys ++ rev x:xs

rev(x:(xs ++ ys)) = rev ys ++ rev x:xs

rev(xs ++ ys) ++ [x] = rev ys ++ rev x:xs

rev(xs ++ ys) ++ [x] = rev ys ++ rev xs ++ [x]

**rev(xs ++ ys) ++ [x] = rev (ys ++ xs) ++ [x]**

# 18.a xs ++ (ys ++ zs) = (xs ++ ys) ++ zs

**Caso Base**
[] ++ (ys ++ zs) = ([] ++ ys) ++ zs

ys ++ zs = ys ++ zs

**Hipótesis inductiva**
xs ++ (ys ++ zs) = (xs ++ ys) ++ zs

**Paso inductivo**
x:xs ++ (ys ++ zs) = (x:xs ++ ys) ++ zs

x:(xs ++ (ys ++ zs)) = x:(xs ++ (ys ++ zs))






