#Lädt das Paket
#Installieren der Pakete
install.packages("quantmod")   
install.packages("tidyverse")
install.packages("rugarch")
install.packages("devtools")
install.packages("PerformanceAnalytics")

##
source("Funktionen.R")

##
library(quantmod)
library(ggplot2)
library(rugarch)
library(PerformanceAnalytics)


#Globale Variablem
startZeitraum = "2010-07-01"     #startzeitraum der Daten
endzeitraum = "2020-03-20"       #Endzeitraum der Daten
kurswahl = 6                     # Kurswahl: 1=Open, 2=High, 3=Low, 4=Close, 5=Volume, 6=Adjusted

#Lädt die Daten für DAX und Bitcoin-Euro
DAX = getKurse("^GDAXI", startZeitraum, endzeitraum, kurswahl)
BitcoinEUR = getKurse("BTC-EUR", startZeitraum, endzeitraum, kurswahl)

#Jahreswerte
Bfirstdays = do.call(rbind, lapply(split(BitcoinEUR, "years"), first))
BlastDays  = do.call(rbind, lapply(split(BitcoinEUR, "years"), last))

getReturn("jährlich", "last", BitcoinEUR)

VaR()


#matrix = as.matrix(DAX)
#zeitachse = time(BitcoinEUR)   #Zeitachse des Objektes

#Berechnung der Mittelwerte
#Bitcoinmittelwert=mean(BitcoinEUR)
#DAXMittelwert = mean(DAX)
#Standardabweichung
#BitcoinStandardabweichung = sd(BitcoinEUR)
#DAXStandardabweichung = sd(DAX)

