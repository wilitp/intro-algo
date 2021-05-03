# 1) Remover los paréntesis superfluos

**a) ((((a = b) ∧ (b = c)) => (a = c)) === True)**

a = b ∧ b = c => a = c === True

**b) (((p => q) ∧ (q => p)) => (p === q))**

(p => q) ∧ (q => p) => (p === q)

**c) (((p ∧ q) ∨ (!r)) => (p ∧ (q ∨ r)))**

(p ∧ q) ∨ !r => p ∧ (q ∨ r)

# 2) Introducí paréntesis para explicitar la precedencia

**a) p ∨ q => r === (p => r) ∧ (q => r)**

((p ∨ q) => r) === ((p => r) ∧ (q => r))

**b) p => q === p ∨ q === q**

((p => q) === (p ∨ q)) === q

**c) p => q === !p ∨ q**

(p => q) === ((!p) ∨ q)


# 3) Están bien las siguientes expresiones? Para evitar errores, introducí paréntesis y en caso de ser posible, escribí una tabla con el tipo de cada variable.

a) ((True ∧ False) => False) === False
b) 2 = 3 ∨ 3 = 4 ∨ a ∗ a + 2 6 b + 7
c) (x ∧ y === a) ∧ z 6 w
d) x + 3 => y
e) (x + 3 = y) ∧ !z
f ) a ∨ b = 3 + y
g) a > b ∧ 3 + 2 < 4 => c === b + 1 = 2
h) a + 2 > c => 3 + 2 < b === c === b = 2 ∗ a
i) !a ∗ b + c = d ∨ p => q === r ⇐ s ∧ j = k + l ∗ m

# 4) Decidir si la fórmula es válida. 

a) p 

No válida, puede ser False. Si es satisfactible

b) p === p

Válida, siempre p equivale a p

c) p === p === p

No válida, en caso de que p sea False, tenemos: 

(False === False) === False
True === False
False

Si es satisfactible.


d) p ⇒ q === q ⇒ p

Si es satisfactible, no válida

e) p ∨ q ⇒ p

No es válida, si p=False y q=True, tenemos:

False || True => False
True => False
False

Si es satisfacible

f ) p ∧ q ⇒ p

Si es válida

g) p ⇒ q ∧ p

No es válida, si p=True y q=False, tenemos:

True => False && True
False

h) p ⇒ q ∨ p

Válida.

i) p ⇒ q

No válida, satisfactible.

j) p ⇒ (q ⇒ p)

No válida, satisfactible.

k) p === p === True

Válida

l) True ∨ p

Válida

m) True ∧ p

No válida, satisfactible

n) False ∨ p

No válida, satisfactible

ñ) False ∧ p

No válida, no satisfactible

# 5) Da ejemplos de

a) válida (y por lo tanto satisfactible).

p === p

b) satisfactible pero no válida.

p === True

c) no satisfactible (y por lo tanto no válida).

p === !p


# 6) Desmostrar teorémas

Ejemplo: 

(p !== (q !== r)) === ((p !== q) !== r)

!(p === !q === r) === !(!p === q === r)

(!p === !q === r) === !(q === !p === r)

(!p === !q === r) === (!q === !p === r)

(!p === !q === r) === (!p === !q === r)

{Reflexividad del ===}

True


**a) Reflexividad del equivalente: (p === p) === True**

(p === p) === True

{Asociatividad}

p === p === True

{Conmutatividad}

p === True === p

{Neutro de la equivalencia}

True


b) Doble negación: !!p === p

!!p === p

{Definición de la negación P:=!!p Q:=p}

!(!p === p)

{Definición de la negación P:=!p Q:=p}

!!(p === p)

{Reflexividad de la equivalencia}

!!(True)

{Definción de False}

!False

{Neutro de la equivalencia}

!(False === True)

{Conmutatividad}

!(True === False)

{Definición de la negación}

!True === False

{Definición de False}

False=== False

{Reflexividad}

True

**c) Equivalencia y negación: p === False === !p**

p === False === !p

{Conmutatividad}

p === !p === False

{Definición de la negación}

!(p === p) === False

{Reflexividad del ===}

!True === False

{Definición de False}

False === False

{Reflexividad del ===}

**d) Neutro de la discrepancia: (p !== False) === p**

(p !== False) === p

{Definición de discrepancia}

!(p === False) === p

{Definción de False y conmutatividad}

!(!True === p) === p

{Definición de la negación}

!!(True === p) === p

{Definición de la negación x2}

!!(True === p === p)

{Reflexividad del ===}

!!(p === p === p === p)

{Reflexividad del ===}

!!(True)

{Doble negación}

True




