## 10) Demostrar `#(stutter.xs) = 2 * #xs`

**Caso base**
```noop
#(stutter.[]) = 2 * #[]
{Caso base de stutter}
#([]) = 2 * #[]
{Caso base cardinal}
0 = 2 * 0
{Aritmética}
0 = 0
True
```

**Paso inductivo**
```noop
Hipótesis: #(stutter.ks) = 2 * #ks

#(stutter.(k:ks)) = 2 * #(k:ks)
{Caso recursivo de stutter}
#(k:(k:stutter.ks)) = 2 * #(k:ks)
{ Caso recursivo de cardinal x3}
1 + 1 + #(stutter.ks) = 2 * (1 + #ks)
{Aritmética}
2 + #(stutter.ks) = 2 + 2 * #ks
{Uniformidad del igual}
#(stutter.ks) = 2 * #ks
{Hipótesis}
True
```

## 11) Demostrar `soloPares(xs ++ ys) = soloPares.xs ++ soloPares.ys`
```haskell
-- 1
soloPares [] = []
-- 2
soloPares (x:xs) | even x = x : soloPares xs
                 | Otherwise = soloPares xs
```

**Caso base**
```noop
soloPares([] ++ ys) = soloPares.[] ++ soloPares.ys
{Caso base concatenar}
soloPares(ys) = soloPares.[] ++ soloPares.ys
{1}
soloPares(ys) = [] ++ soloPares.ys
{Caso base concatenar}
soloPares(ys) = soloPares.ys
{Reflexividad}
True
```
**Paso inductivo**
```noop
Hipótesis: soloPares(ks ++ ys) = soloPares.ks ++ soloPares.ys

Caso k es par
soloPares.(k:ks ++ ys) = soloPares.(k:ks) ++ soloPares.ys
{Caso recursivo de concatenar}
soloPares.(k:(ks ++ ys)) = soloPares.(k:ks) ++ soloPares.ys
{Caso recursivo soloPares}
k : soloPares.(ks ++ ys) = k : soloPares.(ks) ++ soloPares.ys
{Hipótesis}
k : soloPares.(ks ++ ys) = k : soloPares.(ks ++ ys)
{Reflexividad}
True

Caso k es impar
soloPares.(k:ks ++ ys) = soloPares.(k:ks) ++ soloPares.ys
{Caso recursivo de concatenar}
soloPares.(k:(ks ++ ys)) = soloPares.(k:ks) ++ soloPares.ys
{Caso recursivo soloPares}
soloPares.(ks ++ ys) = soloPares.(ks) ++ soloPares.ys
{Hipótesis}
True

```

## 12) Demostrar `cuantos0y1.xs = cuantos0y1.(swap0y1.xs)`
```haskell
-- 1
cuantos0y1 [] = 0
--2
cuantos0y1 (x:xs) | x == 0 V x == 1 = 1 + cuantos0y1 xs
                  | Otherwise = cuantos0y1
--3
swap0y1 [] = []
--4
swap0y1 (x:xs) | x == 1 = 0 : swap0y1 xs
               | x == 0 = 1 : swap0y1 xs
               | Otherwise = x : swap0y1 xs
```

**Caso base**
```noop
cuantos0y1.[] = cuantos0y1.(swap0y1.[])
{1}
cuantos0y1.[] = cuantos0y1.([])
{Reflexividad}
True
''
```

**Paso inductivo**
```noop
Hipótesis: cuantos0y1.ks = cuantos0y1.(swap0y1.ks)

cuantos0y1.(k:ks) = cuantos0y1.(swap0y1.(k:ks))

Caso k = 1 o 0
{2}
cuantos0y1.(k:ks) = cuantos0y1.(swap0y1.(k:ks))
1 + cuantos0y1.ks = cuantos0y1.(swap0y1.(k:ks))
{4 y 2}
1 + cuantos0y1.ks = 1 + cuantos0y1.(swap0y1.ks)
{Uniformidad del igual}
cuantos0y1.ks = cuantos0y1.(swap0y1.ks)
{Hipótesis}
True

Caso k != 1,0
cuantos0y1.(k:ks) = cuantos0y1.(swap0y1.(k:ks))
{2}
cuantos0y1.ks = cuantos0y1.(swap0y1.(k:ks))
{4}
cuantos0y1.ks = cuantos0y1.(k : swap0y1.(ks))
{2}
cuantos0y1.ks = cuantos0y1.(swap0y1.(ks))
{Hipótesis}
True


```

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

{ Distribución de la disyunción }

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

## 16) Debilitamiento para V

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

{ Morgan conjunción x2 }

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

{ Conmutación + reflexividad de la equivalencia}

True
```

## 19) Monotonía de la conjunción

```noop
(p => q) => (p && r => q && r)

{ Caracterización de la implicación }

!(!p V q) V (!(p && r) V (q && r))

{ Morgan para la disyunción }

(p && !q) V (!(p && r) V (q && r))

{ Morgan para la conjunción }

(p && !q) V (!p V !r V (q && r))

{ Distribución de la disyunción en la conjunción }

(p && !q) V (!p V (!r V q && !r V r))

{ Tercero excluido }

(p && !q) V (!p V (!r V q && True))

{ Neutro de la conjunción }

(p && !q) V (!p V (!r V q))

{ Asociación de la disyunción }

(p && !q) V !p V !r V q

{ Distribución de la disyunción en la conjunción }

(p V q && !q V q) V !p V !r

{ Tercero excluido y neutro de la conjunción }

p V q V !p V !r

{Tercero excluido + absorvente de la disyunción}

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

q V r V (!p === p === False)

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
```noop
<Ex :: cuadrado.x> && <Ax :: amarillo.x> => <Ex :: cuadrado.x && amarillo.x>
{ Definición de existe }
<Ex :: cuadrado.x> && !<Ex :: !amarillo.x> => <Ex :: cuadrado.x && amarillo.x>
{ Currificación }
<Ex :: cuadrado.x> => (!<Ex :: !amarillo.x> => <Ex :: cuadrado.x && amarillo.x>)
{ Caracterización del implica }
<Ex :: cuadrado.x> => (<Ex :: !amarillo.x> V <Ex :: cuadrado.x && amarillo.x>)
{ Regla del término del existe }
<Ex :: cuadrado.x> => <Ex :: !amarillo.x V (cuadrado.x && amarillo.x>)
{ Distribución del V en &&}
<Ex :: cuadrado.x> => <Ex :: (!amarillo.x V cuadrado.x) && (!amarillo.x V amarillo.x)>)
{ Tercero excluido + neutro de la conjunción }
<Ex :: cuadrado.x> => <Ex :: (!amarillo.x V cuadrado.x)>)
{ Regla del término del existe }
<Ex :: cuadrado.x> => <Ex :: !amarillo.x> V <Ex :: cuadrado.x)>)
{ Debilitamiento para V}
True
```


## 27) Formalizar: Ningún círculo en xs es rojo
```noop
<Ax : x E xs && circulo.x : !rojo.x>

{ Definición existe }
```

## 28) Formalizar: Hay un único cuadrado xs y es rojo

```noop
<Ei : validI.i.xs : cuadrado.xs!!i && rojo.xs!!i && !<Ej : validI.j.xs && j != i : cuadrado.xs!!j> >
```

## 29) Formalizar: Todas la figuras de xs son triángulos rojos o cuadrados

```noop
<Ax : x E xs : (triangulo.x && rojo.x) V cuadrado.x>

<Ax : x E xs && triangulo.x : rojo.x> && <Ax : x E xs && !triangulo.x : cuadrado.x>
```

## 30) Formalizar: Existe solo un elemento mayor a cero

```noop
<Ei : validI.i.xs : xs!!i > 0 <Aj: validI.j.xs && (j != i) : > >
```

## 31) Formalizar: 

a) Hay un triángulo en xs con tamaño menor a 5.

```noop
<Ex: x e xs : traingulo.x && (tam.x < 5) >
```

b) El último elemento de xs está en ys.

```noop
xs!!(#xs-1) e ys
```

## 32) Demostrar

**4)**

```noop
<Ax :: !(P.x => Q.x)> === <Ax :: P.x> && <Ax :: !Q.x>

{ Regla del término del para todo}

<Ax :: !(P.x => Q.x)> === <Ax :: P.x && !Q.x>

{ Morgan conjunción }

<Ax :: !(P.x => Q.x)> === <Ax :: !(!P.x V Q.x)>

{ Caracterización del implica }

<Ax :: !(P.x => Q.x)> === <Ax :: !(P.x => Q.x)>

{ Reflexividad de la equivalencia}

True
```

**a)**

```noop
<Ax :: Tx> => <Ax : R.x : T.x>

{ Definición dual del implica }

<Ax :: Tx> && <Ax : R.x : T.x> === <Ax :: T.x>

{ Partición de rango del para todo }

<Ax : True V R.x : T.x> === <Ax :: T.x>

{ Absorvente de la disyunción }

<Ax :: T.x> === <Ax :: T.x>

{ Reflexividad }

True

```

## 33) Demostrar

```noop
<Ex : R.x : T.x > && __<Ax : R.x : S.x>__ => <Ex : R.x : T.x && S.x>
{ Definición de existe }
<Ex : R.x : T.x> && !<Ex : R.x : !S.x> => <Ex : R.x : T.x && S.x>
{ Currificación }
<Ex : R.x : T.x> => (!<Ex : R.x : !S.x> => <Ex : R.x : T.x && S.x>)
{ Caracterización del implica }
<Ex : R.x : T.x> => (<Ex : R.x : !S.x> V <Ex : R.x : T.x && S.x>)
{ Regla del término del existe }
<Ex : R.x : T.x> => (<Ex : R.x : !S.x V (T.x && S.x>))
{ Distribución de la disyunción en la conjunción }
<Ex : R.x : T.x> => (<Ex : R.x : (!S.x V T.x) && (!S.x V S.x)>)
{ Tercero excluido + neutro de la conjunción }
<Ex : R.x : T.x> => <Ex : R.x : !S.x V T.x>
{ Regla del término del existe }
<Ex : R.x : T.x> => <Ex : R.x : !S.x> V <Ex : R.x : T.x>
{ Debilitamiento para disyunción }
True
```

## 34) Demostrar

```noop
<Ax :: P.x => Q.x> => (<Ex :: P.x> => <Ex :: Q.x>)
{ Intercambio de rango y término }
<Ax : P.x : Q.x> => (<Ex :: P.x> => <Ex :: Q.x>)
{ Caracterización del implica }
!<Ax : P.x : Q.x> V (<Ex :: P.x> => <Ex :: Q.x>)
{ Definición de existe }
<Ex : P.x : !Q.x> V (<Ex :: P.x> => <Ex :: Q.x>)
{ Intercambio de rango y término del existe }
<Ex :: P.x && !Q.x> V (<Ex :: P.x> => <Ex :: Q.x>)
{ Caracterización del implica }
__<Ex :: P.x && !Q.x>__ V !<Ex :: P.x> V __<Ex :: Q.x>__
{ Conmutación + regla del término del existe }
<Ex :: __(P.x && !Q.x) V Q.x__> V !<Ex :: P.x>
{ Distribución del V en el &&}
<Ex :: (P.x V Q.x) && (!Q.x V Q.x)> V !<Ex :: P.x>
{ Tercero excluido y Neutro de la conjunción }
<Ex :: P.x V Q.x> V !<Ex :: P.x>
{ Caracterización del implica }
<Ex :: P.x> => <Ex :: P.x V Q.x>
{ Regla del término del existe y debilitamiento para V}
True 
```

## 35) No existe xd

## 36) Demostrar
```noop
__<Ax : R.x : T.x >__ && __<Ax : !T.x : R.x>__ === <Ax :: T.x>
{ Definición de existe x2 }
!<Ex : __R.x : !T.x__ > && !<Ex : __!T.x : !R.x__> === <Ax :: T.x>
{Intercambio de rango y término del existe x2}
__!<Ex : !T.x : R.x > && !<Ex : !T.x : !R.x>__ === <Ax :: T.x>
{Morgan &&}
!(__<Ex : !T.x : R.x > V <Ex : !T.x : !R.x>__) === <Ax :: T.x>
{Regla del término del existe}
!(<Ex : !T.x : __R.x V !R.x>) === <Ax :: T.x>
{Tercero excluido}
!(<Ex : __!T.x : True__>) === <Ax :: T.x>
{Intercambio de rango y término x2}
__!(<Ex : True : !T.x>)__ === <Ax :: T.x>
{Definición de existe}
__<Ax :: T.x> === <Ax :: T.x>__
{Reflexividad de la equivalencia}
True
```
## 37) Demostrar `algunCuadrado.xs === <Ex : x e xs : cuadrado.x>`

```haskell
-- 1
algunCuadrado [] = False
--2
algunCuadrado (x:xs) = cuadrado.x V algunCuadrado xs

-- 3
e x [] = False
-- 4
e x (y:ys) = x == y || e x ys 
```

**Caso base**
```noop
algunCuadrado.[] === <Ex : x e [] : cuadrado.x>
{2}
False === <Ex : x e [] : cuadrado.x>
{3}
False === <Ex : False : cuadrado.x>
{Rango vacío del existe}
False === False
True
```

**Hipótesis**
```noop
algunCuadrado.ks === <Ek : k e ks : cuadrado.x>
```

**Caso inductivo**
```noop
algunCuadrado.(k:ks) === <Eh : h e (k:ks) : cuadrado.h>
{ Caso recursivo del pertenece }
algunCuadrado.(k:ks) === <Eh : h === k V (e h ks) : cuadrado.h>
{Partición del rango de existe}
algunCuadrado.(k:ks) === <Eh : h === k : cuadrado.h> V <Eh : h e ks : cuadrado.h>
{Rango unitario}
algunCuadrado.(k:ks) === cuadrado.k V <Eh : h e ks : cuadrado.h>
{Caso recursivo de algunCuadrado}
cuadrado.k V algunCuadrado.ks === cuadrado.k V <Eh : h e ks : cuadrado.h>
{Cambio de variable + hipótesis + reflexividad}
True
```

## 38) Demostrar que `soloCeros.xs === <Ax : x e xs : x == 0>`

```haskell
soloCeros [] = True
soloCeros (x:xs) = x == 0 && soloCeros xs
```

**Caso Base**
```noop
soloCeros.[] === <Ax : x e [] : x == 0>
{Caso base soloCeros}
True === <Ax : x e [] : x == 0>
{Caso base pertenece}
True === <Ax : False : x == 0>
{Rango vacío del para todo}
True === True
True
```

**Paso Inductivo**
Hipótesis:
```noop
soloCeros.ks === <Ax : k e ks : k == 0>

soloCeros.(k:ks) === <Ax : h e (k:ks) : h == 0>
{Caso recursivo de solo ceros}
k==0 && soloCeros.ks === <Ax : h e (k:ks) : h == 0>
{Caso recursivo de pertenece}
k==0 && soloCeros.ks === <Ax : h==k V h e ks : h == 0>
{Partición de rango del para todo}
k==0 && soloCeros.ks === <Ax : h==k : h == 0> && <Ax : h e ks : h == 0>
{Rango unitario del para todo}
k==0 && soloCeros.ks === k==0 && <Ax : h e ks : h == 0>
{Cambio de variable y hipótesis}
k==0 && soloCeros.ks === k==0 && soloCeros.ks
{Reflexividad}
True
```
