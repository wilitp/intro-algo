
### *1)*
### *2)*
### *3)*
2 + 1
Es válida porque tanto 2 como 1 son números y expresiones a la vez y + es un operador.
### *5) Expresión inválida*
2 -
Es inválidia porque el operador - no se encuentra entre 2 expresiones.

### *6) Fórmula válida*
2 + 1 = 3
Es válida porque 2+1 es una expresión valida y 3 también. Y una fórmula se construye con expresiones y símolos de relación en medio.

### *7)Quitá los paréntesis que sean superfluos*
a) ((5+1) + (3\*6)) * (8\*5)
rta: 5 + 1 + 3\*6 * 8 * 5 
b) ((2^2)+5) < (2+4)
rta: 2^2 + 5 < 2 + 4

### *8)Introducí paréntesis para que la precedencia sea explícita*
a) 5 \* 3 >= 7 - 7 + 3
rta: (5\*3) >= ((7 - 7) + 3)
b) 3 + 4 * x = 4
rta: (3 + (4 * x)) = 4

### *9)*
### *10) Escribí el tipo de los siguientes operadores: *,/,^2,<=, =>. Que pasa con el operador -?*
\*: Num
/: Num
^2: Num
<=: Bool 
>=: Bool

Con el operador 

### *11 y 12)* 
a) 70 \* 47 / (3+2)
rta: 658
b) ( 3 + 1 ) \* 10 = 25
rta: falso
c) 2 \* x + y = 1 + 2 * y
rta: x e y no existen en el contexto actual

### *13) Identificá las variables, las constantes y el nombre de la función de cada definición:*
```haskell
--a 
f.x = 5*x

--b
duplica a = a + a

--c
por2 y = 2*y

--d
multiplicar zz tt = zz*tt
```
a)
- nombre: f
- variables: x
- constantes: 5
b)
- nombre: duplica
- variables: a
c)
- nombre: por2
- variables: y
- constantes: 2
d)
- nombre: multiplicar
- variables: 'zz' y 'tt'
### *14) Función promedio*
```haskell
promedio x y = (x + y) / 2
```
### *15) Evaluá las siguientes expresiones*
```haskell
-- a
multiplicar (f 5) 2 + 1
--b
por2 (duplica (3+5))
```
a) 51
b) 32

### *16) Tipos de las funciones del 13 y 14
```haskell
-- 13
f :: Num => a -> a
duplica :: Num => a -> a
por2:: Num => a -> a
multiplicar :: Num => a -> a -> a

-- 14
promedio :: Num a => a -> a -> a
```
### *17) 
```haskell
g :: Num a => a -> a
h :: Num a => a -> a -> a
j :: (Ord a, Num a) => a -> Bool 
```

## El resto en Main.hs
