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
    na.omit(Return.calculate(temp))
  };
  if (periode == ""){
    na.omit(Return.calculate(data))
  }
}