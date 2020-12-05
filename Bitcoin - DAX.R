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




#########
#Funktionen
#########

#Liefert die Kursdaten des Kurses "symbols" von im Zeitraum start-ende
#kurs gibt an, welche Art der Kursdaten verwendet werden soll
getKurse = function(symbols, start, ende, kurs){
  tempKurs = getSymbols(Symbols = symbols, from = start, auto.assign = FALSE)[,kurswahl];
  tempKurs[paste0('/',ende)]
}

#Liefert den Return
#periode gibt an ob jährlich, wöchentlich oder täglich
#day gibt an, ob first=erster Tag pro Periode, last=letzter Tag pro Periode
getReturn = function(periode, day, data){
  if (periode == "jährlich") {
    temp = do.call(rbind, lapply(split(data, "years"), last));
  };
  Return.calculate(temp)
}


