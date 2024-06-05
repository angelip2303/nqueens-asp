queen(1..n)   .

% colocamos una reina en la fila i en caso de que no haya una reina en la columna j
1 { placeQueen(I, J) : queen(I) } 1 :- queen(J)  .

% colocamos una reina en la columna j en caso de que no haya una reina en la fila i
1 { placeQueen(I, J) : queen(J) } 1 :- queen(I)  .

% comprobamos las diagonales; es decir, las reinas no se atacan entre sí
:- placeQueen(I, J), placeQueen(I', J'), I != I', J != J', I - J == I' - J' .
:- placeQueen(I, J), placeQueen(I', J'), I != I', J != J', I + J == I' + J' .