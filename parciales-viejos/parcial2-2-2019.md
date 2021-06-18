
1.a

```
q => p === p => q === !p === !q 

{caracterizacion}

!q V p === !p V q === !p === !q 

{conmutación}

(!q V p === !q V False) === (!p V q === !p V False)

{ Distributividad de la disyunción + neutro de la disyunción }

!q V (p === False) === !p V (q === False)

{t2}

!q V !p === !p V !q

{comutación}

!p V !q === !p V !q

{ Reflexividad }

True
```

1. b

```
!p && q === ¬(p && ¬q === q) === (p === False)


{Equivalencia y negación}

!p && q === !(p && !q === q) === !p

{Morgan y def de la negación}

!p && q === !!(!p V q === q) === !p

{Doble negación}

!p && q === !p V q === q === !p

{Regla dorada}

!p === q === q === !p

{Conmutacion y asociatividad}

(!p === q) === (!p === q)

{Reflevidad}

True



```
