

## 13) Demostrar por inducción que cuantos.1.(agregaSiguiente.xs) = cuantos.0.xs + cuantos.1.xs
```haskell
-- 1
cuantos n [] = 0 

-- 2
cuantos n (x:xs) | x == n = 1 + cuantos n xs 
                 | Otherwise = cuantos n xs

-- 3
agregaSiguiente [] = [] 

-- 4
agregaSiguiente(x:xs) = x : (x+1) : agregaSiguiente 
```

**Caso base**
```
cuantos.1.(agregaSiguiente.[]) = cuantos.0.[] + cuantos.1.[]

{ 3 }

cuantos.1.[] = cuantos.0.[] + cuantos.1.[]

{ 1 }
0 = 0 + 0

{ Aritmética }

True

```

**Hipótesis ind**

```noop
cuantos.1.(agregaSiguiente.ks) = cuantos.0.ks + cuantos.1.ks
```

**Caso inductivo**
```noop
cuantos.1.(agregaSiguiente.(k:ks)) = cuantos.0.(k:ks) + cuantos.1.(k:ks)

// Caso k = 0
{ Por 2 y 4}

cuantos.1.(k:(k+1):agregaSiguiente.ks) = 1 + cuantos.0.ks + cuantos.1.ks

{ 2 x2 }

1 + cuantos.1.(agregaSiguiente.ks) = 1 + cuantos.0.ks + cuantos.1.ks

{ Hip }

1 + cuantos.1.(agregaSiguiente.ks) = 1 + cuantos.1.(agregaSiguiente.ks)

{ Reflexividad del igual }

True

// Caso k = 1
{ Por 2 y 4}

cuantos.1.(k:(k+1):agregaSiguiente.ks) =  cuantos.0.ks + 1 + cuantos.1.ks

{ 2 x2 y conmutatividad de la suma }

1 + cuantos.1.(agregaSiguiente.ks) = 1 + cuantos.0.ks + cuantos.1.ks

{ Hip }

1 + cuantos.1.(agregaSiguiente.ks) = 1 + cuantos.1.(agregaSiguiente.ks)

{ Reflexividad del igual }

True

// Caso k != 0,1
{ Por 2 y 4}

cuantos.1.(k:(k+1):agregaSiguiente.ks) =  cuantos.0.ks + cuantos.1.ks

{ 2 x2 y conmutatividad de la suma }

cuantos.1.(agregaSiguiente.ks) = cuantos.0.ks + cuantos.1.ks

{ Hip }

True
```

## 14) Morgan para la conjunción

```noop

!(p && q) === !p V !q

{ Regla dorada }

!(p V q === p === q) === !p V !q

{ Definición de implicación  }

!( p => q === p ) === !p V !q

{ Definición de negación }

p => q === !p === !p V !q

{ Caracterización de la implicación }

!p V q === !p === !p V !q

{ Distribución de la disyunción con la equivalencia }

!p V (q === False === !q)

{ Equivalencia y negación }

!p V True

{ Absorvente de la disyunción }

True
```


## 15) Ley de absorción

```noop
p && (p V q) === p

{ Regla dorada }

p === (p V q) === p V (p V q) === p

{ Distribución de la disyunción  }

p V ( False === q === p V q === False )

{ Reflexividad y neutro de la equivalencia }

p V ( q === p V q)

{ Definición de implica }

p V ( p => q )

{ Caracterización del implica }

p V !p V q 

{ Tercero excluido }

True V q

{ Absorvente de la disyunción }

True

```

## 16) 

```noop

p => (p V q)

{ Definición de implica }

p V (p V q) === (p V q)

{ Idempotencia de la disyunción }

p V q === p V q

{ Reflexividad de la equivalencia }

True
```

## 17) Modus ponens

```noop

p && (p => q) === p && q

{ Morgan conjunción  }

!(!p V !(p => q)) === !(!p V !q)

{Definición de negación x2 + conmutatividad + doble negación}

!p V !(p => q) === !p V !q

{ Distribución de la disyunción con la equivalencia }

!p V (!(p => q) === !q)

{ Definición de implica }

!p V (!(p V q === q) === !q)

{ Definición de negación }

!p V (p V q === !q === !q)

{ Reflexividad + neutro de la equivalencia}

!p V p V q

{ Tercero excluido + absorvente de la disyunción }

True
```

## 18) Contrarrecíproca 
```noop
p => q === !q => !p

{ Caracterización de la implicación }

!p V q === q V !p

{ Conmutación + reflexividad del implica }

True
```

## 19) Monotonía de la conjunción

```noop
(p => q) => (p && r => q && r)

{ Caracterización de la implicación }

!(!p V q) V (!(p && r) V q && r)

{ Morgan para la disyunción }

(p V !q) V (!(p && r) V q && r)

{ Morgan para la conjunción }

(p V !q) V (!p V !r V (q && r))

{ Distribución de la disyunción en la conjunción }

(p V !q) V (!p V (!r V q && !r V r))

{ Tercero excluido }

(p V !q) V (!p V (!r V q && True))

{ Neutro de la conjunción }

(p V !q) V (!p V (!r V q))

{ Asociación de la disyunción }

p V !q V !p V !r V q

{ Tercero excluido (usando q y !q) }

True
```

## 20)
```noop
(p => q) === (q => p) === p === q

{ Definición de implica }

(p V q === q) === (q => p) === p === q

{ Definición dual de implicación }

(p V q === q) === (q && p === q) === p === q

{ Asociación, reflexividad y neutro de la equivalencia }

p V q === q && p === p === q

{ Conmutación + Regla dorada }

True
```

## 21) Demostrar

**a)**

```noop
(p => q) => (p && r => q)

{ Caracterización de la implicación x3 }

!(!p V q) V (!(p && r) V q)

{ Morgan }

(p && !q) V !p V !r V q

{ Conmutación + Distribución de la disyunción y la conjunción }

(p V q && !q V q) V !p V !r 

{ Tercero excluido + neutro de la equivalencia }

p V q  V !p V !r 

{ Tercero excluido + absorvente de la disyunción }

True
```

**b)**

```noop
(!q => !p) V r === p V q V r === q && r === q === r  

{ Regla dorada }

(!q => !p) V r === p V q V r === q V r

{ Caracterización del implica }

q V !p V r === p V q V r === q V r

{ Distribución de la disyunción }

q V r V(!p === p === False)

{ Equivalencia y negación }

q V r V True

{ Absorvente de la disyunción }

True
```

## 22)
```noop
p => (q => r) === !r => (p => !q)

{ Caracterización del implica }

!p V (!q V r) === r V (!p V !q)

{ Asociación y conmutación }

True 
```

## 23)

```noop
!p && q === !(p && !q === q) === (p === False)

{ Equivalencia y negación }

!p && q === !(p && !q === q) === !p

{ Definición de negación }

!p && q === (p && !q === !q) === !p

{ Conmutación y asociación de la equivalencia }

(!p && q === !p) === (p && !q === !q)

{ Definición dual de la implicación }

(!p => q) === (!q => p)

{ Contrarrecíproca }

True
```

## 24) Formalizar: Todas las figuras de xs que tienen tamaño mayor a 5, son cuadrados**
```noop
<Ax : x E xs && tam.x > 5 : cuadrado.x> 
```

## 25) Formalizar: Hay algún cuadrado en xs de tamaño menor a 10

```noop
<Ex : x E xs : cuadrado.x && tam.x < 10 >
```

## 26) Demostrar 
**Debería optimizar**

```noop
<Ex :: cuadrado.x> && <Ax :: amarillo.x> => <Ex :: cuadrado.x && amarillo.x>

{ Currificación }

__<Ex :: cuadrado.x>__ => (<Ax :: amarillo.x> => <Ex :: cuadrado.x && amarillo.x>)

{ Definición existe }

__!<Ax :: !cuadrado.x> => (<Ax :: amarillo.x> => <Ex :: cuadrado.x && amarillo.x>)__

{ Caracterización del implica }

<Ax :: !cuadrado.x> V __(<Ax :: amarillo.x> => <Ex :: cuadrado.x && amarillo.x>)__

{ Caracterización del implica }

<Ax :: !cuadrado.x> V !<Ax :: amarillo.x> V __<Ex :: cuadrado.x && amarillo.x>__

{ Intercambio entre rango y término del existe }

<Ax :: !cuadrado.x> V !<Ax :: amarillo.x> V <Ex : cuadrado.x : amarillo.x>

{ Definición de existe }

__<Ax :: !cuadrado.x>__ V <Ex :: !amarillo.x> V <Ex : cuadrado.x : amarillo.x>

{ Definición de existe }

!<Ex __::__ cuadrado.x> V <Ex :: !amarillo.x> V <Ex : cuadrado.x : amarillo.x>

{ Tercero excluido  }

!__<Ex : amarillo.x V !amarillo.x : cuadrado.x>__ V <Ex :: !amarillo.x> V <Ex : cuadrado.x : amarillo.x>

{ Partición de rango del existe }

__!(<Ex : amarillo.x : cuadrado.x> V <Ex : !amarillo.x : cuadrado.x>)__ V <Ex :: !amarillo.x> V <Ex : cuadrado.x : amarillo.x>

{ Morgan }

(!<Ex : amarillo.x : cuadrado.x> && !<Ex : !amarillo.x : cuadrado.x>) V <Ex :: !amarillo.x> V __<Ex : cuadrado.x : amarillo.x>__

{ Conmutación de la disyunción }

__<Ex : cuadrado.x : amarillo.x> V (!<Ex : amarillo.x : cuadrado.x> && !<Ex : !amarillo.x : cuadrado.x>)__ V <Ex :: !amarillo.x>

{ Distribución de la disyunción en la conjunción}

( __<Ex : cuadrado.x : amarillo.x> V !<Ex : amarillo.x : cuadrado.x>__ && <Ex : cuadrado.x : amarillo.x> V !<Ex : !amarillo.x : cuadrado.x>) V <Ex :: !amarillo.x>

{ Intercambio de rango y término del existe + tercero excluido }

( True && <Ex : cuadrado.x : amarillo.x> V !<Ex : !amarillo.x : cuadrado.x>) V <Ex :: !amarillo.x>

{ Neutro de la conjunción }

<Ex : cuadrado.x : amarillo.x> V !<Ex _: !amarillo.x : cuadrado.x__> V <Ex :: !amarillo.x>

{ Intercambio de rango y término del existe }

<Ex : cuadrado.x : amarillo.x> V __!<Ex : cuadrado.x : !amarillo.x> V <Ex :: !amarillo.x>_

{ Definición de existe }

<Ex : cuadrado.x : amarillo.x> V __<Ax : cuadrado.x : amarillo.x> V !<Ax :: amarillo.x>__

{ Queda probar que <Ax : cuadrado.x : amarillo.x> V !<Ax :: amarillo.x> es un teorema(Pensar el escenario en el que ambas partes son False hace evidente que lo es). 
Luego toda la expresión es un teorema por absorvente de la disyunción }

__<Ax : cuadrado.x : amarillo.x> V !<Ax :: amarillo.x>__

{ Conmutación + Caracterización del implica }

__<Ax :: amarillo.x> => <Ax : cuadrado.x : amarillo.x>__

{ Definición dual de implicación }

<Ax :: amarillo.x> && <Ax : cuadrado.x : amarillo.x> === <Ax :: amarillo.x>

{ Partición del rango del para todo }

<Ax : True V cuadrado.x : amarillo.x> === <Ax :: amarillo.x>

{ Absorvente de la conjunción }

<Ax :: amarillo.x> === <Ax :: amarillo.x>

{ Reflexividad }

True

Luego <Ex : cuadrado.x : amarillo.x> V True === True

```



## 31) Demostrar que las siguientes fórmulas son teoremas del Cálculo de Predicados.

**a)**

```noop
<Ax :: Tx> => <Ax : R.x : T.x>

{ Definición del implica }

<Ax :: Tx> V <Ax : R.x : T.x> === <Ax : R.x : T.x>

{ Regla dorada }

<Ax :: Tx> && <Ax : R.x : T.x> === <Ax :: T.x>

{ Partición de rango del para todo }

<Ax : True V R.x : T.x> === <Ax :: T.x>

{ Absorvente de la disyunción }

<Ax :: T.x> === <Ax :: T.x>

{ Reflexividad }

True

```

## 32) Demostrar

```noop
__<Ex : R.x : T.x >__ && __<Ax : R.x : S.x>__ => __<Ex : R.x : T.x && S.x>__

{ Intercambio rango y término de todo x3 }

<Ex :: R.x && T.x > && <Ax :: R.x => S.x> => <Ex :: R.x && T.x && S.x>
```

## 33) Demostrar

```noop
<Ax :: P.x => Q.x> => (<Ex :: P.x> => <Ex :: Q.x>)
```
