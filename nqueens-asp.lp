cequeenll(1..n)   .

% colocamos como máximo una reina por fila
1 { placeQueen(I, J) : queen(I) } 1 :- queen(J)  .

% colocamos como máximo una reina por columna
1 { placeQueen(I, J) : queen(J) } 1 :- queen(I)  .

:- placeQueen(I, J), placeQueen(I', J'), I != I', J != J', I - J == I' - J' .
:- placeQueen(I, J), placeQueen(I', J'), I != I', J != J', I + J == I' + J' .