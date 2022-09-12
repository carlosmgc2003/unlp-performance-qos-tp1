# Import de la libreria
library(fitdistrplus)
# Lectura de los CSV
tiempos_servicio <- read.csv("tiempo_servicio.csv")
servicios_mean <- mean(tiempos_servicio$y)
# Normalizacion de los datos entre [0, 1]
servicios = tiempos_servicio$y / max(tiempos_servicio$y)
# Graficación de los histogramas
hist(servicios, plot=TRUE)
# Obtencion de los parametros para "gamma"
ans_servicios <- fitdist(servicios, distr = "gamma", method = "mle")
plot(ans_servicios, demp = TRUE)
descdist(servicios, boot = 1000)
# Mean de servicios
print(servicios_mean)
# C
print(sqrt(var(tiempos_servicio$y))/servicios_mean)
# shape o factor forma
print(1/ans_servicios$estimate["shape"])
# rate es beta y el software JMT requiere Tita que es igual a 1/beta
tita <- 1/(ans_servicios$estimate["rate"])
print(tita)