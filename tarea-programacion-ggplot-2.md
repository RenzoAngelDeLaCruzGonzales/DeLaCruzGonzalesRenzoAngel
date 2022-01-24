EJERCICIOS DE GGPLOT2
================
De La Cruz Renzo, Harold Garcia y Camila Luque
23/1/2022

# Visualizacion de datos

## Introduccion

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 4.1.2

    ## Warning: package 'ggplot2' was built under R version 4.1.2

    ## Warning: package 'tibble' was built under R version 4.1.2

    ## Warning: package 'tidyr' was built under R version 4.1.2

    ## Warning: package 'readr' was built under R version 4.1.2

    ## Warning: package 'purrr' was built under R version 4.1.2

    ## Warning: package 'dplyr' was built under R version 4.1.2

    ## Warning: package 'stringr' was built under R version 4.1.2

    ## Warning: package 'forcats' was built under R version 4.1.2

``` r
library(datos)
```

    ## Warning: package 'datos' was built under R version 4.1.2

## Parte 1: Ggplot base

### 1. Ejecuta ggplot(data = millas). ¿Qué observas?

``` r
ggplot(data = millas)
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

``` r
# Este código crea un gráfico “vacío”. Solo se ve el fondo, pero no se dibuja nada sobre él porque no se han especificado las otras dos capas mínimas: aes() para mapear las variables y geom_*() para indicar la representación gráfica a utilizar.
```

### 2. ¿Cuántas filas hay en millas? ¿Cuántas columnas?

``` r
nrow(millas)
```

    ## [1] 234

``` r
ncol(millas)
```

    ## [1] 11

``` r
# Hay `r nrow(millas)` filas y `r ncol(millas)` columnas en el dataset `millas`. 
```

``` r
# Otra manera de ver el numero de filas y de columnas es imprimiendo el objeto en la consola. Al inicio nos indicara el tipo de objeto que es y sus dimensiones en terminos de `filas x columnas`. Algo parecido ocurrirra si utilizamos `str()`. Si usamos `glimpse()` nos indicara esta informacion como numero de obervaciones y numero de variables.
millas
```

    ## # A tibble: 234 x 11
    ##    fabricante modelo     cilindrada  anio cilindros transmision traccion ciudad
    ##    <chr>      <chr>           <dbl> <int>     <int> <chr>       <chr>     <int>
    ##  1 audi       a4                1.8  1999         4 auto(l5)    d            18
    ##  2 audi       a4                1.8  1999         4 manual(m5)  d            21
    ##  3 audi       a4                2    2008         4 manual(m6)  d            20
    ##  4 audi       a4                2    2008         4 auto(av)    d            21
    ##  5 audi       a4                2.8  1999         6 auto(l5)    d            16
    ##  6 audi       a4                2.8  1999         6 manual(m5)  d            18
    ##  7 audi       a4                3.1  2008         6 auto(av)    d            18
    ##  8 audi       a4 quattro        1.8  1999         4 manual(m5)  4            18
    ##  9 audi       a4 quattro        1.8  1999         4 auto(l5)    4            16
    ## 10 audi       a4 quattro        2    2008         4 manual(m6)  4            20
    ## # ... with 224 more rows, and 3 more variables: autopista <int>,
    ## #   combustible <chr>, clase <chr>

``` r
str(millas)
```

    ## tibble [234 x 11] (S3: tbl_df/tbl/data.frame)
    ##  $ fabricante : chr [1:234] "audi" "audi" "audi" "audi" ...
    ##  $ modelo     : chr [1:234] "a4" "a4" "a4" "a4" ...
    ##  $ cilindrada : num [1:234] 1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
    ##  $ anio       : int [1:234] 1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
    ##  $ cilindros  : int [1:234] 4 4 4 4 6 6 6 4 4 4 ...
    ##  $ transmision: chr [1:234] "auto(l5)" "manual(m5)" "manual(m6)" "auto(av)" ...
    ##  $ traccion   : chr [1:234] "d" "d" "d" "d" ...
    ##  $ ciudad     : int [1:234] 18 21 20 21 16 18 18 18 16 20 ...
    ##  $ autopista  : int [1:234] 29 29 31 30 26 26 27 26 25 28 ...
    ##  $ combustible: chr [1:234] "p" "p" "p" "p" ...
    ##  $ clase      : chr [1:234] "compacto" "compacto" "compacto" "compacto" ...

``` r
glimpse(millas)
```

    ## Rows: 234
    ## Columns: 11
    ## $ fabricante  <chr> "audi", "audi", "audi", "audi", "audi", "audi", "audi", "a~
    ## $ modelo      <chr> "a4", "a4", "a4", "a4", "a4", "a4", "a4", "a4 quattro", "a~
    ## $ cilindrada  <dbl> 1.8, 1.8, 2.0, 2.0, 2.8, 2.8, 3.1, 1.8, 1.8, 2.0, 2.0, 2.8~
    ## $ anio        <int> 1999, 1999, 2008, 2008, 1999, 1999, 2008, 1999, 1999, 2008~
    ## $ cilindros   <int> 4, 4, 4, 4, 6, 6, 6, 4, 4, 4, 4, 6, 6, 6, 6, 6, 6, 8, 8, 8~
    ## $ transmision <chr> "auto(l5)", "manual(m5)", "manual(m6)", "auto(av)", "auto(~
    ## $ traccion    <chr> "d", "d", "d", "d", "d", "d", "d", "4", "4", "4", "4", "4"~
    ## $ ciudad      <int> 18, 21, 20, 21, 16, 18, 18, 18, 16, 20, 19, 15, 17, 17, 15~
    ## $ autopista   <int> 29, 29, 31, 30, 26, 26, 27, 26, 25, 28, 27, 25, 25, 25, 25~
    ## $ combustible <chr> "p", "p", "p", "p", "p", "p", "p", "p", "p", "p", "p", "p"~
    ## $ clase       <chr> "compacto", "compacto", "compacto", "compacto", "compacto"~

### 3. ¿Qué describe la variable traccion? Lee la ayuda de ?millas para encontrar la respuesta.

``` r
unique(millas$traccion)
```

    ## [1] "d" "4" "t"

### 4. Realiza un gráfico de dispersión de autopista versus cilindros.

``` r
ggplot(millas, aes(x = autopista, y = cilindros)) +
  geom_point()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->
### 5. ¿Qué sucede cuando haces un gráfico de dispersión (scatterplot)
de clase versus traccion? ¿Por qué no es útil este gráfico?

``` r
ggplot(millas, aes(x = clase, y = traccion)) +
  geom_point()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

``` r
# Otro problema es la frecuencia de combinaciones posibles no es la misma en todos los casos.
count(millas, traccion, clase)
```

    ## # A tibble: 12 x 3
    ##    traccion clase           n
    ##    <chr>    <chr>       <int>
    ##  1 4        compacto       12
    ##  2 4        mediano         3
    ##  3 4        pickup         33
    ##  4 4        subcompacto     4
    ##  5 4        suv            51
    ##  6 d        compacto       35
    ##  7 d        mediano        38
    ##  8 d        minivan        11
    ##  9 d        subcompacto    22
    ## 10 t        2asientos       5
    ## 11 t        subcompacto     9
    ## 12 t        suv            11

``` r
# Los graficos de dispersion debieran usarse con variables continuas y cuando los valores son unicos.
```

## Parte 2: Mapeos Esteticos

### 1. ¿Qué no va bien en este código? ¿Por qué hay puntos que no son azules?

``` r
ggplot(data = millas) +
     geom_point(mapping = aes(x = cilindrada, y = autopista, color = "blue"))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

``` r
# Se incluye el color dentro de `aes()`, por lo cual se trata como una variable, lo cual ser Ãtil si tuvieramos una columna con informaciÃ³n de los colores.
```

``` r
# Para dejar todos los puntos en color azul, se debe cambiar el orden de los parametros.
ggplot(data = millas) +
     geom_point(mapping = aes(x = cilindrada, y = autopista), color = "blue")
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

### 2. ¿Qué variables en millas son categóricas? ¿Qué variables son continuas? (Pista: escribe ?millas para leer la documentación de ayuda para este conjunto de datos). ¿Cómo puedes ver esta información cuando ejecutas millas?

``` r
# Variables categÃ³ricas: modelo, transmisiÃ³n, tracciÃ³n, combustible y clase.
# Variables continuas: cilindrada, aÃ±o, cilindros, ciudad, autopista.
```

### 3. Asigna una variable continua a color, size, y shape. ¿Cómo se comportan estas estéticas de manera diferente para variables categóricas y variables continuas?

``` r
# Una posibilidad es graficar rendimiento de combustible en autopista dado el tipo de motor. Como informaciÃ³n adicional usamos el rendimiento en ciudad como color, de modo de contar con una paleta de colores informativa.
ggplot(millas, aes(x = cilindrada, y = autopista, colour = ciudad)) +
  geom_point()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->
### 4. ¿Qué ocurre si asignas o mapeas la misma variable a múltiples
estéticas?

``` r
# R va a generar un grÃ¡fico con informaciÃ³n redundante, lo cual se debiera evitar.
ggplot(millas, aes(x = cilindrada, y = autopista, colour = autopista, size = autopista)) +
  geom_point()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->
### 5. ¿Qué hace la estética stroke? ¿Con qué formas trabaja? (Pista:
consulta ?geom_point)

``` r
# Cambia el tamaÃ±o de los bordes de las formas 21 a 25. Para estas formas es posible cambiar el color de relleno y borde y tambiÃ©n el tamaÃ±o de los bordes.
ggplot(mtautos, aes(peso, millas)) +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 5)
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->
### 6. ¿Qué ocurre si se asigna o mapea una estética a algo diferente
del nombre de una variable, como aes(color = cilindrada \< 5)?

``` r
# R crea una variable temporal que da cuenta de la evaluacian de la variable. En el caso de `cilindrada < 5` el resultado es verdadero o falso y segÃºn esto se incluyen los colores en el grÃ¡fico.
ggplot(millas, aes(x = cilindrada, y = autopista, colour = cilindrada < 5)) +
  geom_point()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

## Parte 3: Facetas

### 1. ¿Qué ocurre si intentas separar en facetas una variable continua?

``` r
ggplot(millas, aes(x = cilindros, y = autopista)) +
  geom_point() +
  facet_grid(. ~ ciudad)
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

``` r
# La variable continua es convertida a una variable categÃ³rica y el grÃ¡fico contiene una faceta para cada valor.
```

### 2. ¿Qué significan las celdas vacías que aparecen en el gráfico generado usando facet_grid (traccion \~ cilindros)? ¿Cómo se relacionan con este gráfico?

``` r
ggplot(data = millas) +
     geom_point(mapping = aes(x = traccion, y = cilindros))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

``` r
ggplot(data = millas) +
  geom_point(mapping = aes(x = autopista, y = ciudad)) +
  facet_grid(traccion ~ cilindros)
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

``` r
# Las celdas vacas (facetas) en este grafico corresponden a combinaciones de `traccion` y `cilindros` que no tienen observaciones.
```

``` r
# Son las mismas ubicaciones en el grafico de dispersion de `autopista` y `ciudad` que no tienen grafica.
ggplot(data = millas) +
  geom_point(mapping = aes(x = autopista, y = ciudad))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-19-1.png)<!-- -->
### 3. ¿Qué grafica el siguiente código? ¿Qué hace . ?

``` r
ggplot(data = millas) +
     geom_point(mapping = aes(x = cilindrada, y = autopista)) +
     facet_grid(traccion ~ .)
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-20-1.png)<!-- -->

``` r
   ggplot(data = millas) +
     geom_point(mapping = aes(x = cilindrada, y = autopista)) +
     facet_grid(. ~ cilindros)
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-20-2.png)<!-- -->

``` r
ggplot(data = millas) +
  geom_point(mapping = aes(x = cilindrada, y = autopista)) +
  facet_grid(traccion ~ .)
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-21-1.png)<!-- -->

``` r
ggplot(data = millas) +
  geom_point(mapping = aes(x = cilindrada, y = autopista)) +
  facet_grid (. ~ cilindros)
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-22-1.png)<!-- -->

### 4. Mira de nuevo el primer gráfico en facetas presentado en esta sección:

``` r
ggplot(data = millas) +
     geom_point(mapping = aes(x = cilindrada, y = autopista)) +
     facet_wrap(~ clase, nrow = 2)
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-23-1.png)<!-- -->

``` r
ggplot(data = millas) +
  geom_point(mapping = aes(x = cilindrada, y = autopista, color = clase))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-24-1.png)<!-- -->

## Parte 4: Objetos Geometricos

### 1. ¿Qué geom usarías para generar un gráfico de líneas? ¿Y para un diagrama de caja? ¿Y para un histograma? ¿Y para un gráfico de área

``` r
# grÃ¡fico de lÃ­neas: `geom_line()`
# diagrama de caja: `geom_boxplot()`
#  istograma: `geom_histogram()`
# grÃ¡fico de Ã¡rea: `geom_area()`
```

### 2. Ejecuta este código en tu mente y predice cómo se verá el output. Luego, ejecuta el código en R y verifica tus predicciones.

``` r
 ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista, color = traccion)) +
     geom_point() +
     geom_smooth(se = FALSE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

``` r
# El resultado es un diagrama de dispersiÃ³n con `cilindrada` en el eje x, `autopista` en el eje y los puntos pintados de acuerdo a `traccion`. TambiÃ©n se incluirÃ¡ una lÃ­nea de tendencia, sin el error estÃ¡ndar, para cada grupo de `traccion`.
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista, colour = traccion)) +
  geom_point() +
  geom_smooth(se = FALSE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-27-1.png)<!-- -->

### 3. ¿Qué muestra show.legend = FALSE? ¿Qué pasa si lo quitas? ¿Por qué crees que lo utilizamos antes en el capítulo?

``` r
# Quitar el argumento `show.legend` o definir `show.legend = TRUE` mostrarÃ¡ la relaciÃ³n entre `traccion` y la paleta de colores.
ggplot(data = millas) +
  geom_smooth(mapping = aes(x = cilindrada, y = autopista, colour = traccion))
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->

``` r
# En el capÃ­tulo, la leyenda se suprime ya que con tres grÃ¡ficos, agregar una leyenda al tercero harÃ¡ que se vea de distinto tamaÃ±o. Dejar los grÃ¡ficos de distinto tamaÃ±o dificulta ver cÃ³mo los argumentos cambian la apariencia de los grÃ¡ficos. La finalidad de estos grÃ¡ficos es mostrar la diferencia sin grupos, usando una estÃ©tica de `grupo` y usando una estÃ©tica de `color`, lo cual crea grupos implÃ­citos. En el ejemplo, la leyenda no es necesaria ya que buscar los valores asociados a cada valor no ayuda a evidenciar los datos.
```

### 4. ¿Qué hace el argumento se en geom_smooth()?

``` r
# Agrega las bandas de error estÃ¡ndar a las lÃ­neas.
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista, colour = traccion)) +
  geom_point() +
  geom_smooth(se = TRUE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->

``` r
# Por defecto la opciÃ³n es `se = TRUE`:
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista, colour = traccion)) +
  geom_point() +
  geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-30-1.png)<!-- -->

``` r
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista, colour = traccion)) +
  geom_point() +
  geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-31-1.png)<!-- -->

### 5. ¿Se verán distintos estos gráficos? ¿Por qué sí o por qué no?

``` r
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
     geom_point() +
     geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-32-1.png)<!-- -->

``` r
   ggplot() +
     geom_point(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
     geom_smooth(data = millas, mapping = aes(x = cilindrada, y = autopista))
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-32-2.png)<!-- -->

``` r
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
  geom_point() +
  geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-33-1.png)<!-- -->

``` r
ggplot() +
  geom_point(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
  geom_smooth(data = millas, mapping = aes(x = cilindrada, y = autopista))
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-34-1.png)<!-- -->

### 6. Recrea el código R necesario para generar los siguientes gráficos:

``` r
 ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
     geom_point() +
     geom_smooth(se = FALSE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-35-1.png)<!-- -->

``` r
   ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
     geom_smooth(aes(group = traccion), se = FALSE) +
     geom_point()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-35-2.png)<!-- -->

``` r
   ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista, color = traccion)) +
     geom_point() +
     geom_smooth(se = FALSE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-35-3.png)<!-- -->

``` r
   ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
     geom_point(aes(color = traccion)) +
     geom_smooth(se = FALSE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-35-4.png)<!-- -->

``` r
   ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
     geom_point(aes(color = traccion)) +
     geom_smooth(aes(linetype = traccion), se = FALSE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-35-5.png)<!-- -->

``` r
   ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
     geom_point(size = 4, colour = "white") +
     geom_point(aes(colour = traccion))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-35-6.png)<!-- -->

``` r
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
   geom_point() +
   geom_smooth(se = FALSE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-36-1.png)<!-- -->

``` r
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
   geom_smooth(aes(group = traccion), se = FALSE) +
   geom_point()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-37-1.png)<!-- -->

``` r
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista, color = traccion)) +
   geom_point() +
   geom_smooth(se = FALSE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-38-1.png)<!-- -->

``` r
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
   geom_point(aes(color = traccion)) +
   geom_smooth(se = FALSE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-39-1.png)<!-- -->

``` r
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
   geom_point(aes(color = traccion)) +
   geom_smooth(aes(linetype = traccion), se = FALSE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-40-1.png)<!-- -->

``` r
ggplot(data = millas, mapping = aes(x = cilindrada, y = autopista)) +
   geom_point(size = 4, colour = "white") +
   geom_point(aes(colour = traccion))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-41-1.png)<!-- -->

## Parte 5: Graficos Estadisticos

### 1. ¿Cuál es el geom predeterminado asociado con stat_summary()? ¿Cómo podrías reescribir el gráfico anterior para usar esa función geom en lugar de la función stat?

``` r
ggplot(data = diamantes) +
  geom_pointrange(
    mapping = aes(x = corte, y = profundidad),
    stat = "summary"
  )
```

    ## No summary function supplied, defaulting to `mean_se()`

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-42-1.png)<!-- -->

``` r
ggplot(data = diamantes) +
  geom_pointrange(
    mapping = aes(x = corte, y = profundidad),
    stat = "summary",
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
```

    ## Warning: Ignoring unknown parameters: fun.ymin, fun.ymax, fun.y

    ## No summary function supplied, defaulting to `mean_se()`

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-43-1.png)<!-- -->

### 2. ¿Qué hace geom_col()? ¿En qué se diferencia de geom_bar()?

``` r
# El estadÃ­stico por defecto en `geom_col()` es distinto de `geom_bar()`.

# geom_col()` usa `stat_identity()`, que deja los datos sin transformar.

# geom_col()` espera que los datos contengan los valores de `x` y los valores de `y` que representan la altura de las columnas.

# geom_bar()` usa `stat_bin()` y espera Ãºnicamente los valores de `x`.

# stat_bin()`, procesa los datos de entrada y realiza un conteo del nÃºmero de observaciones para cada valor de `x`, lo cual genera la variable `y` internamente.
```

### 3. La mayoría de los geoms y las transformaciones estadísticas vienen en pares que casi siempre se usan en conjunto. Lee la documentación y haz una lista de todos los pares. ¿Qué tienen en común?

``` r
# Las siguiente tabla contienen los pares entre geometrÃ­as y estadÃ­sticos que se usan en conjunto.

# | geometrÃ­a           | estadÃ­stico         |
# |---------------------|---------------------|
# | `geom_bar()`        | `stat_count()`      |
# | `geom_bin2d()`      | `stat_bin_2d()`     |
# | `geom_boxplot()`    | `stat_boxplot()`    |
# | `geom_contour()`    | `stat_contour()`    |
# | `geom_count()`      | `stat_sum()`        |
# | `geom_density()`    | `stat_density()`    |
# | `geom_density_2d()` | `stat_density_2d()` |
# | `geom_hex()`        | `stat_hex()`        |
# | `geom_freqpoly()`   | `stat_bin()`        |
# | `geom_histogram()`  | `stat_bin()`        |
# | `geom_qq_line()`    | `stat_qq_line()`    |
# | `geom_qq()`         | `stat_qq()`         |
# | `geom_quantile()`   | `stat_quantile()`   |
# | `geom_smooth()`     | `stat_smooth()`     |
# | `geom_violin()`     | `stat_violin()`     |
# | `geom_sf()`         | `stat_sf()`         |

# Tabla: GeometrÃ­as y estadÃ­sticos complementarios

# Los nombres tienen a ser similares, por ejemplo `geom_smooth()` y `stat_smooth()`, aunque hay casos como `geom_bar()` y `stat_count()`.

# La mayorÃ­a de las geometrÃ­as usa por defecto el estadÃ­stico que le corresponde en la tabla anterior. RecÃ­procamente, la mayorÃ­a de los estadÃ­sticos usan por defecto la geometrÃ­a que le corresponde en la tabla anterior.

# Las siguientes tablas contienen las geometrÃ­as y estadÃ­sticos en [ggplot2](https://ggplot2.tidyverse.org/reference/).

# | geometrÃ­a           | estadÃ­stico por defecto | documentaciÃ³n conjunta |
# |:--------------------|:--------------------|-------------|
# | `geom_abline()`     |                     |             |
# | `geom_hline()`      |                     |             |
# | `geom_vline()`      |                     |             |
# | `geom_bar()`        | `stat_count()`      | x           |
# | `geom_col()`        |                     |             |
# | `geom_bin2d()`      | `stat_bin_2d()`     | x           |
# | `geom_blank()`      |                     |             |
# | `geom_boxplot()`    | `stat_boxplot()`    | x           |
# | `geom_countour()`   | `stat_countour()`   | x           |
# | `geom_count()`      | `stat_sum()`        | x           |
# | `geom_density()`    | `stat_density()`    | x           |
# | `geom_density_2d()` | `stat_density_2d()` | x           |
# | `geom_dotplot()`    |                     |             |
# | `geom_errorbarh()`  |                     |             |
# | `geom_hex()`        | `stat_hex()`        | x           |
# | `geom_freqpoly()`   | `stat_bin()`        | x           |
# | `geom_histogram()`  | `stat_bin()`        | x           |
# | `geom_crossbar()`   |                     |             |
# | `geom_errorbar()`   |                     |             |
# | `geom_linerange()`  |                     |             |
# | `geom_pointrange()` |                     |             |
# | `geom_map()`        |                     |             |
# | `geom_point()`      |                     |             |
# | `geom_map()`        |                     |             |
# | `geom_path()`       |                     |             |
# | `geom_line()`       |                     |             |
# | `geom_step()`       |                     |             |
# | `geom_point()`      |                     |             |
# | `geom_polygon()`    |                     |             |
# | `geom_qq_line()`    | `stat_qq_line()`    | x           |
# | `geom_qq()`         | `stat_qq()`         | x           |
# | `geom_quantile()`   | `stat_quantile()`   | x           |
# | `geom_ribbon()`     |                     |             |
# | `geom_area()`       |                     |             |
# | `geom_rug()`        |                     |             |
# | `geom_smooth()`     | `stat_smooth()`     | x           |
# | `geom_spoke()`      |                     |             |
# | `geom_label()`      |                     |             |
# | `geom_text()`       |                     |             |
# | `geom_raster()`     |                     |             |
# | `geom_rect()`       |                     |             |
# | `geom_tile()`       |                     |             |
# | `geom_violin()`     | `stat_ydensity()`   | x           |
# | `geom_sf()`         | `stat_sf()`         | x           |

# Tabla: ggplot2 capas de geometrÃ­as y sus estadÃ­sticos por defecto.

# | estadÃ­stico          | geometrÃ­a por defecto | documentaciÃ³n conjunta |
# |:---------------------|:--------------------|-------------|
# | `stat_ecdf()`        | `geom_step()`       |             |
# | `stat_ellipse()`     | `geom_path()`       |             |
# | `stat_function()`    | `geom_path()`       |             |
# | `stat_identity()`    | `geom_point()`      |             |
# | `stat_summary_2d()`  | `geom_tile()`       |             |
# | `stat_summary_hex()` | `geom_hex()`        |             |
# | `stat_summary_bin()` | `geom_pointrange()` |             |
# | `stat_summary()`     | `geom_pointrange()` |             |
# | `stat_unique()`      | `geom_point()`      |             |
# | `stat_count()`       | `geom_bar()`        | x           |
# | `stat_bin_2d()`      | `geom_tile()`       | x           |
# | `stat_boxplot()`     | `geom_boxplot()`    | x           |
# | `stat_countour()`    | `geom_contour()`    | x           |
# | `stat_sum()`         | `geom_point()`      | x           |
# | `stat_density()`     | `geom_area()`       | x           |
# | `stat_density_2d()`  | `geom_density_2d()` | x           |
# | `stat_bin_hex()`     | `geom_hex()`        | x           |
# | `stat_bin()`         | `geom_bar()`        | x           |
# | `stat_qq_line()`     | `geom_path()`       | x           |
# | `stat_qq()`          | `geom_point()`      | x           |
# | `stat_quantile()`    | `geom_quantile()`   | x           |
# | `stat_smooth()`      | `geom_smooth()`     | x           |
# | `stat_ydensity()`    | `geom_violin()`     | x           |
# | `stat_sf()`          | `geom_rect()`       | x           |

# Tabla: ggplot2 capas de estadÃ­sticos y sus geometrÃ­as por defecto.
```

### 4. ¿Qué variables calcula stat_smooth()? ¿Qué parámetros controlan su comportamiento?

``` r
# La funciÃ³n `stat_smooth()` calcula las siguientes variables:

# `y`: valor predicho
# `ymin`: menor valor del intervalo de confianza
# `ymax`: mayor valor del intervalo de confianza
# `se`: error estÃ¡ndar

# La secciÃ³n "Computed Variables" en la documentaciÃ³n de `stat_smooth()` contiene estas variables.

# Los parÃ¡metros que controlan `stat_smooth()` incluyen

# `method`: cuÃ¡l mÃ©todo utilizar
# `formula`: las fÃ³rmulas, al igual que `method`, determinan cÃ³mo se harÃ¡ el cÃ¡lculo del intervalo de confianza y los argumentos adicionales que se requieran.
# `na.rm`: si acaso se eliminarÃ¡n los casos perdidos
```

### 5. En nuestro gráfico de barras de proporción necesitamos establecer group = 1. ¿Por qué? En otras palabras, ¿cuál es el problema con estos dos gráficos?

``` r
   ggplot(data = diamantes) +
     geom_bar(mapping = aes(x = corte, y = ..prop..))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-47-1.png)<!-- -->

``` r
   ggplot(data = diamantes) +
     geom_bar(mapping = aes(x = corte, fill = color, y = ..prop..))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-47-2.png)<!-- -->

``` r
# Si no se incluye `group = 1`, todas las baras en el grÃ¡fico tendrÃ¡n altura 1. La funciÃ³n `geom_bar()` asume que los grupos son iguales a los valores de `x` dado que el estadÃ­stico realiza un conteo dentro de los grupos.
ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = corte, y = ..prop..))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-48-1.png)<!-- -->

``` r
# El problema con estos grÃ¡ficos es que las proporciones se calculan dentro de los grupos.
ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = corte, y = ..prop..))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-49-1.png)<!-- -->

``` r
ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = corte, fill = color, y = ..prop..))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-49-2.png)<!-- -->

``` r
# El siguiente cÃ³digo generarÃ¡ el grÃ¡fico buscado sin relleno.
ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = corte, y = ..prop.., group = 1))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-50-1.png)<!-- -->

``` r
# Con el argumento `fill`, es necesario normalizar las barras.
ggplot(data = diamantes) + 
  geom_bar(aes(x = corte, y = ..count.. / sum(..count..), fill = color))
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-51-1.png)<!-- -->

## Parte 6: Ajuste de Posicion

### 1. ¿Cuál es el problema con este gráfico? ¿Cómo podrías mejorarlo?

``` r
ggplot(data = millas, mapping = aes(x = ciudad, y = autopista)) +
     geom_point()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-52-1.png)<!-- -->

``` r
# Existe superposicion ya que hay multiples observaciones para cada combinacion de `ciudad` y `autopista`. Se puede mejorar el grafico usando el argumento de distorsion y asi reducir la superposicion.
ggplot(data = millas, mapping = aes(x = ciudad, y = autopista)) +
  geom_point(position = "jitter")
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-53-1.png)<!-- -->
### 2. Qué parámetros de geom_jitter() controlan la cantidad de ruido?

``` r
# `width` controla el desplazamiento vertical
# `height` controla el desplazamiento horizontal
# Los valores por defecto de `width` y `height` introducen ruido en ambas direcciones.
# Asi se ve el grafico con las opciones por defecto.
```

``` r
ggplot(data = millas, mapping = aes(x = ciudad, y = autopista)) +
  geom_point(position = position_jitter())
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-55-1.png)<!-- -->

``` r
# Con `width = 0` se elimina la distorsion horizontal.
ggplot(data = millas, mapping = aes(x = ciudad, y = autopista)) +
  geom_jitter(width = 0)
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-56-1.png)<!-- -->

``` r
# Con `width = 20` se agrega mucha distorsion.
ggplot(data = millas, mapping = aes(x = ciudad, y = autopista)) +
  geom_jitter(width = 20)
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-57-1.png)<!-- -->

``` r
# Es analogo para `height`. Hay que notar que `width` y `height` se expresan en las mismas unidades que los datos, por lo que `height = 1` o `width = 1` corresponden a diferentes valores relativos de distorsiÃ³n dependiendo de las escalas de `x` e `y`.

# Los valores por defecto son 80% de la resolucion (`resolution()`) de los datos. Cuando `x` e `y` son discretas, su resolucion es igual a uno, y los valores por defecto son `height = 0.4` y `width = 0.4` ya que la distorsion mueve los puntos en direccion positiva y negativa.
```

### 3. Compara y contrasta geom_jitter() con geom_count()

``` r
ggplot(data = millas, mapping = aes(x = ciudad, y = autopista)) +
  geom_jitter()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-58-1.png)<!-- -->

``` r
# `geom_count()` cambia el tamaÃ±o de los puntos relativo a la cantidad de observaciones. Las combinaciones de `x` e `y` con mas observaciones tendran un mayor tamaño. Esto no distorsiona los valores, pero tiene el problema de que el tamaño de los puntos puede generar superposicion si los puntos son cercanos.
ggplot(data = millas, mapping = aes(x = ciudad, y = autopista)) +
  geom_count()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-59-1.png)<!-- -->

``` r
# Por ejemplo, `geom_count()` puede ser menos legible que `geom_jitter()` si se agrega un argumento de color.
ggplot(data = millas, mapping = aes(x = ciudad, y = autopista, color = clase)) +
  geom_jitter()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-60-1.png)<!-- -->

``` r
ggplot(data = millas, mapping = aes(x = ciudad, y = autopista, color = clase)) +
  geom_count()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-60-2.png)<!-- -->

### 4. ¿Cuál es el ajuste de posición predeterminado de geom_boxplot()? Crea una visualización del conjunto de datos de millas que lo demuestre.

``` r
# Si agregamos `colour = clase` a un diagrama de cajas, los niveles de `transmision` se ubican lado a lado.
ggplot(data = millas, aes(x = transmision, y = autopista, colour = clase)) +
  geom_boxplot()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-61-1.png)<!-- -->

``` r
# Si se usa `position_identity()` habra superposicion.
ggplot(data = millas, aes(x = transmision, y = autopista, colour = clase)) +
  geom_boxplot(position = "identity")
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-62-1.png)<!-- -->

## Parte 7: Sistema de Coordenadas

### 1. Convierte un gráfico de barras apiladas en un gráfico circular usando coord_polar().

``` r
ggplot(millas, aes(x = factor(1), fill = traccion)) +
  geom_bar()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-63-1.png)<!-- -->

``` r
# Ahora agregamos `coord_polar(theta="y")` para crear el grafico de torta:
ggplot(millas, aes(x = factor(1), fill = traccion)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-64-1.png)<!-- -->

``` r
# El argumento `theta = "y"` transforma `y` en el angulo de cada seccion. Si `coord_polar()` se especifica sin `theta = "y"`, el resultado se llama "ojo de buey".
ggplot(millas, aes(x = factor(1), fill = traccion)) +
  geom_bar(width = 1) +
  coord_polar()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-65-1.png)<!-- -->

### 2. ¿Qué hace labs()? Lee la documentación.

``` r
ggplot(data = millas, mapping = aes(x = clase, y = autopista)) +
  geom_boxplot() +
  coord_flip() +
  labs(y = "Millas por GalÃ³n en Autopista",
       x = "Clase",
       title = "Millas por GalÃ³n en Autopista por Tipo de VehÃ­culo",
       subtitle = "1999-2008",
       caption = "Fuente: http://fueleconomy.gov")
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-66-1.png)<!-- -->

``` r
# `labs()` no es la unica funcion para agregar titulos. `xlab()`, `ylab()` y `ggtitle()` realizan la misma funcion.
```

### 3. ¿Cuál es la diferencia entre coord_quickmap() y coord_map()?

``` r
# `coord_map()` usa una proyeccion cartografica para proyectar la Tierra sobre una superficie bidimensional. Por defecto usa la [Proyeccion de Mercator](https://es.wikipedia.org/wiki/Proyecci%C3%B3n_de_Mercator), la cual se aplica a todas las geometrias del grafico.

# `coord_quickmap()` usa una aproximacion mas rapida que ignora la curvatura de la tierra y ajusta de acuerdo a la razon de latitud y longitud. Esta es una alternativa computacionalmente mas rapida que no genera la necesidad de transformar las geometrias individuales.

# Consulta [coord_map()](https://ggplot2.tidyverse.org/reference/coord_map.html) para la documentacion y ejemplos.
```

### 4. ¿Qué te dice la gráfica siguiente sobre la relación entre ciudad y autopista? ¿Por qué es coord_fixed() importante? ¿Qué hace geom_abline()?

``` r
ggplot(data = millas, mapping = aes(x = ciudad, y = autopista)) +
     geom_point() +
     geom_abline() +
     coord_fixed()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-68-1.png)<!-- -->

``` r
# La funcion `coord_fixed()` asegura que la linea que genera `geom_abline()` tenga un angulo de 45 grados. De este modo es mas facil comparar a partir de los casos en que los rendimientos en autopista y ciudad son iguales.
```

``` r
ggplot(data = millas, mapping = aes(x = ciudad, y = autopista)) +
  geom_point() +
  geom_abline() +
  coord_fixed()
```

![](tarea-programacion-ggplot-2_files/figure-gfm/unnamed-chunk-69-1.png)<!-- -->

``` r
# Lo que podemos ver es que en todos los modelos el rendimiento en autopista es superior al rendmiento en ciudad.
```
