# Import de la libreria
library(fitdistrplus)
# Lectura de los CSV
tiempos_arribo <- read.csv("tiempo_arribo.csv")
arribos_mean <- mean(tiempos_arribo$x)
print(arribos_mean)
print(sqrt(var(tiempos_arribo$x))/arribos_mean)
# Normalizacion de los datos entre [0, 1]
arribos = tiempos_arribo$x / max(tiempos_arribo$x)
# Graficación de los histogramas
hist(arribos, plot=TRUE)
# Obtencion de los parametros para "gamma"
ans_arribos <- fitdist(arribos, distr = "gamma", method = "mle")
plot(ans_arribos, demp = TRUE)
print(ans_arribos$estimate)