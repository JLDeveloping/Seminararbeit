#Lädt das Paket
#Installieren der Pakete
install.packages("quantmod")   
install.packages("tidyverse")
install.packages("rugarch")
#install.packages("devtools")
install.packages("PerformanceAnalytics")

##
source("Funktionen.R")

##
library(quantmod)
library(ggplot2)
library(rugarch)
library(PerformanceAnalytics)



#Globale Variablem
startZeitraum = "2019-03-21"     #startzeitraum der Daten
endzeitraum = "2020-03-20"       #Endzeitraum der Daten
kurswahl = 6                     # Kurswahl: 1=Open, 2=High, 3=Low, 4=Close, 5=Volume, 6=Adjusted

#Lädt die Daten für DAX und Bitcoin-Euro
DAX = getKurse("^GDAXI", startZeitraum, endzeitraum, kurswahl)
BitcoinEUR = getKurse("BTC-USD", startZeitraum, endzeitraum, kurswahl)

#
BitcoinEURRendite = getReturn("", "last", BitcoinEUR)
DAXRendite = getReturn("jährlich", "last", DAX)

BitcoinEURVar = VaR(ROC(BitcoinEUR), p=0.95, type, method = "modified")

###
temp = do.call(rbind, lapply(split(DAX, "years"), last));
c(first(DAX)[,1]-first(temp)[,1], Return.calculate(temp)[2:length(temp)])
pr = checkData(DAX, method = "xts")
a = c(lag.xts(pr))


#matrix = as.matrix(DAX)
#zeitachse = time(BitcoinEUR)   #Zeitachse des Objektes
#ROC()  eventuell für Rendite