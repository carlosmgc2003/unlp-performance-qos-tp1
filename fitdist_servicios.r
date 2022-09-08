# Import de la libreria
library(fitdistrplus)
# Lectura de los CSV
tiempos_servicio <- read.csv("tiempo_servicio.csv")
servicios_mean <- mean(tiempos_servicio$y)
print(servicios_mean)
print(sqrt(var(tiempos_servicio$y))/servicios_mean)
# Normalizacion de los datos entre [0, 1]
servicios = tiempos_servicio$y / max(tiempos_servicio$y)
# Graficación de los histogramas
hist(servicios, plot=TRUE)
# Obtencion de los parametros para "gamma"
ans_servicios <- fitdist(servicios, distr = "gamma", method = "mle")
print(summary(ans_servicios))
plot(ans_servicios, demp = TRUE)
print(ans_servicios$estimate)