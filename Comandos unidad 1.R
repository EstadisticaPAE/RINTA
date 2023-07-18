# Comandos del la unidad 1
# Ayuda en R
help(mean)
help.search('median')
?plot

#Paquetes de R
paquetes <- library(help = "datasets")
head(paquetes$info[[2]])

# Lectura de base de datos
library(readxl)
datos <- read_excel("incendios.xlsx")
names(datos)
colnames(datos)<-c("Edad", "partido" ,  "total" ,  "negligencia",
                "intencional", "natural" ,    "desconocida")
summary(datos)

# Estadisticas básicas
library(fBasics)
estadisticas_datos <- basicStats(datos[, c(4:7)])
round(estadisticas_datos, 2)

#Gráficos simples en R
demo("graphics")
plot(iris)

# Histograma
hist(iris$Sepal.Length)

#Boxplox
boxplot(iris)

# Barplot
edad<-c(17,18,18,17,18,19,18,16,18,18, 19, 19)
table(edad)
barplot(table(edad))

# Manipulación de datos usando tidyverse
# Seleccionando variables (columnas)
library(dplyr)
select(datos, fecha, provincia, total)

dplyr::select(datos, fecha, provincia, total)# los argumentos son, primero el objeto que contiene 
                                             #el data frame, y luego los títulos de las columnas a extraer
# Seleccionado niveles de una variable
dplyr::filter(datos, provincia == "Chubut") # los argumentos son, primero el objeto que contiene el data frame,
                                             #y luego la columna con el criterio de filtro

# Usando la grámatica pipe
datos %>% select(fecha, provincia, total)

datos%>%filter(provincia == "Chubut") 

# Data frame
edad <- c(12, 11, 9, 8, 10, 12, 10, 9, 12, 10)
altura <- c(1.42, 103.6, 118.9, 138.1, 120.3, 109.9, 124.8, 133.7, 122.9, 119.2)
sexo <- c("M","H","H","M","M","H","M","M","H","H")
datos <- data.frame(edad,altura,sexo)
datos

# Datos faltantes
edad <- c(12, 11, 9, 8, 10, 12, 10, 9, 12, NA)
mean(edad)
mean(edad, na.rm = TRUE)
