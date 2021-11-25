#1
10000%%3
#2 
0 == (4560%%3)
#3 
#¿Cuáles de esos números son divisibles por 7?
numeros_enteros <- c(2:87)
divisibles_7 <- (0 == numeros_enteros%%7)
which(divisibles_7 == TRUE)
numeros_enteros[c(6,13,20,27,34,41,48,55,62,69,76,83)]
#4.
primer_vector <- c(seq(7,3,-1))
segundo_vector <- c(head(seq(0,100,5),5))
#Sea A la condición de ser par en el primer vector.
A <- (0 == primer_vector%%2)
which(A == TRUE)
primer_vector [c(2,4)]
#Sea B la condición de ser mayor que 10 en el segundo vector.
B <- which(segundo_vector >10)
segundo_vector [c(4,5)]
#¿En cuál de las 5 posiciones se cumple A y B simultáneamente?
for (i in 1:5) {
  for (j in 1:5){
    if(i==j)
    {if(primer_vector[i]==segundo_vector[j]){
      print(i)
    }
      
    }
  }
}
print("no hay datos")

#5.
Gauss <- function(a) {
  r1 <- (a*(a+1))/2
  return(r1)
} 
Gauss(a = 1:100)
#6.
k <- c(1,-4,5,9,-4)
min(k)
which(k==-4)
#7. 
factorial(8)
#8.
sumatoria1 <- function(i){
  exp(i)
}
sumatoria1(3:7)
sum(sumatoria1(3:7))
#9.
mifuncion <- function(i){
  log10(sqrt(i))
}
a <- mifuncion(1:10)
prod(a)
#10.
Areacorona <- function(x,y){
  ((x)^2)/2*(y-sin(y))
}
Areacorona(4,pi/4)
#11.
vector_11 <- c(1:10)
sort(vector_11,decreasing = T)
rev(vector_11)
#12. 
g <- 10:100
h <- g^3
i <- g^2
sum(h) + sum(4*i)
#13.
g <- 10:100
h <- g^3
i <- g^2
sum(h) + sum(4*i)
#14
#Calcular el número de variables del dataset
dataset <- read.delim("https://raw.githubusercontent.com/fhernanb/datos/master/Paises.txt")
length(dataset)
#¿Cuántos países hay en el dataset?
dataset$Pais
length(dataset$Pais)
#¿Cuál es el país con mayor población?
dataset$Pais[which.max(dataset$poblacion)]
#¿Cuál es el país con alfabetización más baja?
dataset$Pais [which.min(dataset$alfabetizacion)]
#15
help("mtcars")
#Autos que tengan un rendimiento menor a 18 millas por galón de combustible.
row.names(mtcars)[which(mtcars$mpg <18)]
#Autos que tengan 4 cilindros.
row.names(mtcars)[which(mtcars$cyl == 4)]
#Autos que pesen más de 2500 libras y tengan transmisión manual.
row.names(mtcars)[which(mtcars$wt >2,5 & mtcars$am =="1")]
#16




















































































  