## 1. Demostrar teoremas

**a)**

```
q => p === p => q === !p === !q

{ Caracterización del implica }

!q || p === !p || q === !p === !q

{ Morgan }

!q || p === !(p && !q) === !p === !q

{ Definición de la negación y conmutación }

!(p || !q === p && !q) === !(p === !q)

{ Regla dorada }

!(p === !q) === !(p === !q)

{ Reflexividad }

True
```

**b)**
```
p && !q => (q => r)

{ Caracterización del implica}

!(p && !q) || (!q || r)

{ Morgan }

!p || q || !q || r

{ Tercero excluido }

!p || True || r

{ Absorvente de la disyunción }

True
```

## 2. Formalizar en lenguaje de predicados

**a) Ningún círculo en xs es rojo**

```
!<3x : x E xs : circulo.x && rojo.x>
```


**b) Hay exactamente dos cuadrados en xs, uno rojo y uno azul**

```
< Ei,j : (0 <= i,j < #xs -1) && i != j : cuadrados.[xs!!i, xs!!j] && rojo.xs!!i && azul.xs!!j && <Az : (0 <= z <= #xs - 1 ) && z != j,i : !(cuadrado.xs!!z)> >
```

## 3. Dar una lista que cumpla y otra que no cumpla la siguiente especificación.
```
<3y : y E xs : triangulo.x && rojo.y> && <Ax : x E xs && triangulo.x : <3y : y E xs : circulo.y && !(rojo.y)> > 

xsPos = [(Triangulo, Rojo, 3), (Circulo, Azul, 3)]

xsNeg= []
```

## 4. Demostrar

```
<3x :: P.x => Q.x > === <3x :: !P.x> || <3x :: Q.x>

{ Partición de rango}

<3x :: P.x => Q.x > === <3x :: !P.x || Q.x>

{ Caracterización del implica }

<3x :: P.x => Q.x > === <3x :: P.x => Q.x>

{ Reflexividad }

True
```

## 5. Verificar noHayCR

```
noHayCR :: [Figura] -> Bool

noHayCR [] = True

noHayCR (x:xs) = !(circulo.x && rojo.x) && noHayCR.xs

E.y.[] = False

E.y.(x:xs) = x == y && E.y.xs 

```

### **Caso Base**

```
noHayCR.[] = !<3y : y E [] : circulo.y && rojo.y>

{ Caso base de noHayCR}

True = !<3y : y E [] : circulo.y && rojo.y>

{ Rango vacío del existe }

True = !False

{ Definición de true }

True = !!True

{ Doble negación }

True = True

{ Reflexividad }

True
```

### **Hipótesis inductiva**

```
noHayCR.(ks) = !<3y : y E (ks) : circulo.y && rojo.y>
```

### **Paso inductivo**

```
noHayCR.(k:ks) = !<3y : y E (k:ks) : circulo.y && rojo.y>

{ Caso recursivo de noHayCR }

!(circulo.k && rojo.k) noHayCR.ks = !<3y : y E (k:ks) : circulo.y && rojo.y>

{ Caso recursivo de existe }

!(circulo.k && rojo.k) noHayCR.ks = !<3y : y == k && y E ks : circulo.y && rojo.y>

{ Definición de existe }

!(circulo.k && rojo.k) noHayCR.ks = <Ay : y == k && y E ks : !(circulo.y && rojo.y)>

{ Partición de rango }

!(circulo.k && rojo.k) noHayCR.ks = <Ay : y == k : !(circulo.y && rojo.y)> && <Ay : y E ks : !(circulo.y && rojo.y) >

{ Rango unitario }

!(circulo.k && rojo.k) noHayCR.ks = !(circulo.k && rojo.k) && <Ay : y E ks : !(circulo.y && rojo.y) >

{ Hipótesis inductiva + definición de existe }

!(circulo.k && rojo.k) <Ay : y E ks : !(circulo.y && rojo.y) > = !(circulo.k && rojo.k) && <Ay : y E ks : !(circulo.y && rojo.y) >

{ Reflexividad }

True
```

