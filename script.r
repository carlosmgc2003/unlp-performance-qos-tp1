tiempos_arribo <- read.csv("tiempo_arribo.csv")
tiempos_servicio <- read.csv("tiempo_servicio.csv")
print(class(tiempos_servicio$y))

hist(tiempos_arribo$x, plot=TRUE)
hist(tiempos_servicio$y, plot=TRUE)