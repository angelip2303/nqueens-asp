# El problema de las N-Reinas
<!-- Por: Ángel Iglesias Préstamo -->

Antes de comenzar a modelar el problema usando Answer Set Programming, quiero
detenerme brevemente a describir el problema que queremos resolver. El problema
de las N-Reinas consiste en determinar las N posiciones -- en el tablero de
ajedrez -- de N reinas de tal manera que éstas no se amenacen entre sí. Dicho
de otra manera,

1. Como máximo habrá una reina por fila,
2. Como máximo habrá una reina por columna,
3. Las reinas no pueden compartir diagonal.

De esta manera, para satisfacer la primera restricción haremos uso de una regla
como la que se puede ver a continuación, donde se determina, mediante una 
regla de elección, como mínimo y máximo 1 reina que irá en la fila iésima,
siempre y cuando se cumpla que no hay una reina en la posición jésima. Repetiremos
este proceso para las columnas.

```
1 { placeQueen(I, J) : queen(I) } 1 :- queen(J)  .
```

Una vez tenemos determinado que como máximo puede haber una reina por fila, o
por columna, y que éstas no se atacan ni vertical, ni horizontalmente. Debemos
comprobar las diagonales. Para ello, vamos a hacer usode la restricción que se
muestra a continuación, donde para un par de reinas (I,J), y (I',J'),
verificaremos que:

1. Estas no se encuentran en la misma posición; i.e `I != I'` y `J != J'`.
2. La resta de los elementos de la primera, comparada con la resta de los
   elementos de la segunda, nos fuerza a que dos reinas no pueden estar
   en la misma diagonal. Debemos repetir este proceso con la suma para 
   identificar la otra posible diagonal.

```
:- placeQueen(I, J), placeQueen(I', J'), I != I', J != J', I - J == I' - J'
```

De esta manera tan sencilla hemos conseguido modelar el problema de las N-Reinas
en base a sus restricciones; es decir, de una manera declarativa, dejando que
sea el solver el que resuelva el problema de la manera que precise.

Si bien quizás se podrían introducir más optimizaciones, considero que esta
solución, aunque sencilla, se comporta razonablemente bien. De hecho, para
darme una solución al problema de las 100-reinas, en un ordenador convencional,
ha tardado 12.060 segundos. Lo que es un cifra más que razonable.

# Uso del programa

1. Nos debemos asegurar de que tenemos instalado en nuestro ordenador un solver
   para ASP, en este caso, hemos decidido optar por [https://potassco.org/clingo/](clingo).
2. Ejecutamos el programa `nqueens-asp.lp` usando el solver.
   ```
   clingo nqueens-asp.lp 10 --const n=5
   ```
   Donde `n=5` determina que colocaremos 5 reinas en un tablero de 5 filas y
   5 columnas. Esto nos devolverá las 10 soluciones posibles para el problema
   de las 5-Reinas.