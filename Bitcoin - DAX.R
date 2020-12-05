#Lädt das Paket
#Installieren der Pakete
install.packages("quantmod")   
install.packages("tidyverse")
install.packages("rugarch")
install.packages("devtools")
install.packages("PerformanceAnalytics")

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


##
zeitachse = time(BitcoinEUR)   #Zeitachse des Objektes


#Berechnung der Mittelwerte
Bitcoinmittelwert=mean(BitcoinEURBeobachtungen[,kurswahl])
DAXMittelwert = mean(DAXBeobachtungen[,kurswahl])
#Standardabweichung
BitcoinStandardabweichung = sd(BitcoinEURBeobachtungen[,kurswahl])
DAXStandardabweichung = sd(DAXBeobachtungen[,kurswahl])

#Jahreswerte
Bfirstdays = do.call(rbind, lapply(split(BitcoinEURBeobachtungen, "years"), first))
BlastDays  = do.call(rbind, lapply(split(BitcoinEURBeobachtungen, "years"), last))

Return.calculate(to.yearly(BitcoinEURBeobachtungen))

VaR()


#matrix = as.matrix(DAX)




#########
#Funktionen
#########

getKurse = function(symbols, start, ende, kurs){
  tempKurs = getSymbols(Symbols = symbols, from = start, auto.assign = FALSE)[,kurswahl];
  tempKurs[paste0('/',ende)]
}