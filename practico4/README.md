6. Formalizar oraciones

a. Alguna figura de xd es de tamaño mayor a 10

```
< 3x : x E xs : tam.x = 10 >
```

b. Hay un cuadrado en xs

```
< 3x : x E xs : cuadrado.x >
```

c. En xs hay un cuadrado de tamaño mayor a 10

```
< 3x : x E xs : tam.x > 10 > 
```


d. De las figuras de xs, un cuadrado azul es más grande que alguno de los círulos.

```
< 3x : x E xs && cuadrado.x : < 3y : y E xs && círulo.y : tam.x>tam.y >  > 
```

e. Algún círulo de xs no es azul.

```
< 3x : x E xs && círulo.x : !azul.x>
```

8. Formalizar

a) Todo entero es par o impar.

```
<Ax : int.x : even.x || !even.x>
```

b) La lista xs consiste sólo de ceros y unos

```
<Ax : x E xs : x = 0 || x = 1>
```

c) Si el 1 está en xs, también el 0.

```
<3x : x E xs : x = 1> => <3x : x E xs : x = 0>
```

d) La lista xs contiene al menos un True

```
<3x : x E xs : x = True>
```

e) Si xs no es vacía, su primer elemento es 0

```
#xs > 0 => xs!!0 = 0
```

f) Todos los elementos de xs son iguales.

```
< Ax,y : x,y E xs : x = y >
```

g) Todos los elementos de xs son distintos.

```
validIndex.xs.i = 0 <= i <= #xs -1

< Ai,j : validIndex.xs.i && validIndex.xs.j && i != j : xs!!i != xs!!j>
```

## 9.

**Solo un hombre es el Papa**

```
validIndex.xs.i = 0 <= i <= #xs -1

< 3i : validIndex.xs.i : papa.xs!!i <Aj : validIndex.xs.j && j != i && !papa.xs!!j> >
```

## 11. Demostrá los siguientes teoremas

**a) Intercambio entre rango y término del existe**

```
<3x : R.x : T.x> === <3x :: R.x && T.x >

{ Definición de existe }

!<Ax : R.x : !T.x> === <3x :: R.x && T.x >

{ Intercambio entre rango y término del para todo }

!<Ax :: R.x => !T.x> === <3x :: R.x && T.x >

{ Definición de existe }

< 3x :: !(R.x => !T.x) > === < 3x :: R.x && T.x >

{ Caracterización del implica}

< 3x :: !(!R.x || !T.x) > === < 3x :: R.x && T.x >

{ Morgan sobre la disyunción }

< 3x :: R.x && T.x > === < 3x :: R.x && T.x >

{ Reflexividad del equivale}

True
```

**b) Regla del término del existe**

```
< 3x :: R.x > || < 3x :: U.x > === < 3x :: R.x || U.x >

{ Definición del existe }

!< Ax :: !R.x > || !< Ax :: !U.x > === < 3x :: R.x || U.x >

{ Morgan sobre la disyunción }

!(< Ax :: !R.x > && < Ax :: !U.x >) === < 3x :: R.x || U.x >

{ Regla del término del para todo }

!(< Ax :: !R.x && !U.x >) === < 3x :: R.x || U.x >

{ Morgan sobre la conjunción}

!(< Ax :: !(R.x && U.x) >) === < 3x :: R.x || U.x >

{ Definición del existe }

< 3x :: R.x || U.x > === < 3x :: R.x || U.x >

{ Reflexividad del equivale }

True
```

**c) Regla del término del para todo con el mismo rango(distinto de True)**

```
<Ax : R.x : T.x > && <Ax : R.x : U.x > === <Ax : R.x : T.x && U.x> 

{ Intercambio entre rango y término }

<Ax :: R.x => T.x > && <Ax :: R.x => U.x > === <Ax : R.x : T.x && U.x> 

{ Regla del término }

<Ax :: R.x => T.x && R.x => U.x > === <Ax : R.x : T.x && U.x> 

{ Caracterización del implica }

<Ax :: !R.x || T.x && !R.x || U.x > === <Ax : R.x : T.x && U.x> 

{ Distributividad de la disyunción sobre la conjunción }

<Ax :: !R.x || (T.x && U.x) > === <Ax : R.x : T.x && U.x> 

{ Caracterización del implica }

<Ax :: R.x => (T.x && U.x) > === <Ax : R.x : T.x && U.x> 

{ Intercambio entre rango y término }

<Ax : R.x : T.x && U.x > === <Ax : R.x : T.x && U.x> 

{ Reflexividad del equivale }

True
```

**d) Regla del término del existe**

```
<3x : R.x : T.x > || <3x : R.x : U.x > === <3x : R.x : T.x || U.x> 

{ Definición del existe }

!<Ax : R.x : !T.x > || !<Ax : R.x : !U.x > === <3x : R.x : T.x || U.x> 

{ Morgan sobre la disyunción }

!(<Ax : R.x : !T.x > && <Ax : R.x : !U.x >) === <3x : R.x : T.x || U.x> 

{ c }

!(<Ax : R.x : !T.x && !U.x >) === <3x : R.x : T.x || U.x> 

{ Definición del existe }

(<3x : R.x : !(T.x && U.x) >) === <3x : R.x : T.x || U.x> 

{ Morgan sobre la conjunción}

<3x : R.x : T.x || U.x > === <3x : R.x : T.x || U.x> 

{Reflexividad del equivale}

True
```

**e) Partición de rango del para todo**

```
<Ax : R.x || S.x : T.x> === <Ax : R.x : T.x> && <Ax : S.x : T.x>

{ Intercambio de rango y término }

<Ax : R.x || S.x : T.x> === <Ax :: R.x => T.x> && <Ax :: S.x => T.x>

{ Regla del término }

<Ax : R.x || S.x : T.x> === < Ax :: (R.x => T.x) && (S.x => T.x) >

{Caracterización del implica}

<Ax : R.x || S.x : T.x> === < Ax :: (!R.x || T.x) && (!S.x || T.x) >

{ Distributividad de la disyunción }

<Ax : R.x || S.x : T.x> === < Ax :: T.x || (!R.x && !S.x) >

{ Morgan sobre la conjunción}

<Ax : R.x || S.x : T.x> === < Ax :: T.x || !(R.x || S.x) >

{ Caracterización del implica y comutación de la disyunción }

<Ax : R.x || S.x : T.x> === < Ax :: R.x || S.x => T.x>

{ Intercambio entre rango y término }

<Ax : R.x || S.x : T.x> === < Ax : R.x || S.x : T.x>

{ Reflexividad de la equivalencia }

True
```

**f) Partición del rango del existe**

```
< 3x : R.x || S.x : T.x > === < 3x : R.x : T.x > || < 3x : S.x : T.x >

{ Definición de existe }

<3x : R.x || S.x : T.x> === !<Ax : R.x : !T.x> || !<Ax : S.x : !T.x>

{ Morgan sobre la disyunción }

<3x : R.x || S.x : T.x> === !(<Ax : R.x : !T.x> && <Ax : S.x : !T.x>)

{ e }

<3x : R.x || S.x : T.x> === !(<Ax : R.x || S.x : !T.x>)

{ Definición de existe }

<3x : R.x || S.x : T.x> === <3x : R.x || S.x : T.x>

```

**g) Rango unitario del existe**

```
<3x : x = Y : T.x> === T.Y

{ Definición del existe }

!<Ax : x = Y : !T.x> === T.Y

{ Rango unitario de para todo }

!(!T.Y) === T.Y

{ Doble negación }

T.Y === T.Y

{ Reflexividad de la equivalencia }

True

```

**h) Distributividad de && con el existe**

```
X && <3x :: T.x> === <3x :: X && T.x> 
```

