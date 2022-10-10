# Import de la libreria
library(fitdistrplus)
# Lectura de los CSV
tiempos_arribo <- read.csv("tiempo_arribo.csv")
arribos_mean <- mean(tiempos_arribo$x)
# Normalizacion de los datos entre [0, 1]
arribos = tiempos_arribo$x / max(tiempos_arribo$x)
# Graficación de los histogramas
hist(arribos, plot=TRUE)
# Obtencion de los parametros para "gamma"
ans_arribos <- fitdist(arribos, distr = "gamma",method = "mme")
print(ans_arribos)
plot(ans_arribos, demp = TRUE)
descdist(arribos, boot = 1000)
# Mean de arribos
print(arribos_mean)
# Coeficiente de variación
print(sqrt(var(tiempos_arribo$x))/arribos_mean)
# shape o factor forma
print(1/ans_arribos$estimate["shape"])
# rate es beta y el software JMT requiere Tita que es igual a 1/beta
print("Imprimir tita")
tita <- 1/(ans_arribos$estimate["rate"])
print(tita)