## 1. Demostrar que las siguientes fórmulas son teoremas.

**a)**
```
p => ( q => r ) === !r => ( p => !q )

{ Caracterización de la implicación }

!p || ( !q || r ) === r || ( !p || !q )

{ Conmutatividad y asociatividad de la disyunción }

r || ( !p || !q ) === r || ( !p || !q )

{ Reflexividad de la equivalencia }

True
```

**b)**

```
!p && q === !( p && !q === q ) === ( p === False )

{ Definición de False }

!p && q === !( p && !q === q ) === ( p === !True)

{ Definición de negación, absorvente de la equivalencia }

!p && q === !( p && !q === q ) === !p

{ Definición de la negación }

!p && q === p && !q === !q === !p

{ Asociatividad de la equivalencia }

(!p && q === !p) === (p && !q === !q)

{ Regla dorada }

(!p || q === q) === (p || !q === p)

{ Definición del implica }

(!p => q) === (p || !q === p)

{ Conmutatividad de la disyunción }

( !p => q ) === ( !q || p === p )

{ Definición del implica }

( !p => q ) === ( !q => p )

{ Caracterización de la implicación }

( p || q ) === ( q || p )

{ Conmutatividad de la disyunción y reflexividad de la equivalencia }

True
```

## 2. Formalizar las siguientes propiedades escritas en lenguaje natural, en el lenguaje de la lógica de predicados.


**a) Todas las figuras de xs son triángulos rojos o cuadrados**

```
<Ax : x E xs : (triangulo.x && rojo.x) || (cuadrado.x && verde.x) >
```

**b) Existe un único elemento de xs que es mayor estricto que cero**

```
validIndex.xs.i = 0 <= i <= #xs - 1

<3i : validIndex.xs.i : xs!!i < 0 && <Aj : validIndex.xs.j && j != i : xs!!j <= 0 > >
```

## 3. 

## 4. Demostrar que la siguiente fórmula es un teorema de Lógica de Predicados.

```
<Ax : R.x : T.x> && <Ax : !T.x : R.x> === <Ax :: T.x>

{ Intercambio de rango y término }

<Ax :: R.x => T.x> && <Ax :: !T.x => R.x> === <Ax :: T.x>

{ Regla del término de A }

<Ax :: R.x => T.x && !T.x => R.x> === <Ax :: T.x>

{ Caracterización del implica }

<Ax :: (!R.x || T.x) && (T.x || R.x) > === <Ax :: T.x>

{ Distributividad de la disyunción en la conjunción }

<Ax :: T.x || (!R.x && R.x) > === <Ax :: T.x>

{ Principio de no contradicción }

<Ax :: T.x || False > === <Ax :: T.x>

{ Neutro de la conjunción }

<Ax :: T.x > === <Ax :: T.x>

{ Reflexividad del implica }

True

```


## 5. Dada la definición de las funciones todosRoC y E, demostrar:


```
todosRoC xs === <Ay : y E xs : rojo y || circulo y>
```

```haskell
E : A -> [A] -> Bool

E [] = False // 3

E (x:xs) = (e == x) || E xs // 4

todosRoC : [Figura] -> Bool
todosRoC [] = True // 1
todosRoC (x:xs) = (rojo x || circulo x) && todosRoC xs // 2
```

**Caso base**

```
todosRoC [] === <Ay : y E [] : rojo y || circulo y>

{ Rango vacío del para todo}

todosRoC [] === True

{ 1 }
True === True

{}

True
```

**Hipótesis inductiva**

```
todosRoC ks === <Ay : y E ks : rojo y || circulo y>
```

**Caso inductivo**

```
todosRoC k:ks === <Ay : y E k:ks : rojo y || circulo y>

{ Caso recursivo de todosRoC }

(rojo k || circulo k) && todosRoC ks === <Ay : y E k:ks : rojo y || circulo y>

{ Caso recursivo de E }

(rojo k || circulo k) && todosRoC ks === <Ay : y == k || y E ks : rojo y || circulo y>

{ Partición de rango }

(rojo k || circulo k) && todosRoC ks === <Ay : y == k : rojo y || circulo y> && <Ay : y E ks : rojo y || circulo y>

{ Hipótesis inductiva}

(rojo k || circulo k) && todosRoC ks === <Ay : y == k : rojo y || circulo y> && todosRoC ks

{ Rango unitario }

(rojo k || circulo k) && todosRoC ks === (rojo k || circulo k) && todosRoC ks

{ Reflexividad }

True

```
