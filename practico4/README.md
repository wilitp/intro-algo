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

