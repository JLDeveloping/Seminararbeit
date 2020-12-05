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
endeZeitachse = paste0('/',endzeitraum)   #Zusammengefügter String um Zeitreihe abzuschneiden
## Kurswahl: 1=Open, 2=High, 3=Low, 4=Close, 5=Volume, 6=Adjusted
kurswahl = 6

#Lädt die Daten für DAX und Bitcoin-Euro
DAX = getSymbols(Symbols = "^GDAXI", from=startZeitraum, auto.assign = FALSE)[,kurswahl]
BitcoinEUR = getSymbols(Symbols = "BTC-EUR",from=startZeitraum, auto.assign = FALSE)[,kurswahl]

#Lädt die relevante Zeitreihe
DAXBeobachtungen = DAX[endeZeitachse]
BitcoinEURBeobachtungen = BitcoinEUR[endeZeitachse]

##
zeitachse = time(BitcoinEURBeobachtungen)   #Zeitachse des Objektes


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
#Erstellt ein Diagramm mit beiden Verläufen
#chartSeries(Cl(bitcoin_eur_short))
#ggplot(aes(x=time(bitcoin_eur_short),y=bitcoin_eur_short[,1]),data=bitcoin_eur_short) + geom_line()
#lines(DAX_short)
#ugarch