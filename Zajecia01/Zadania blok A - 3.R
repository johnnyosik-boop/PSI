# Zadanie 3.	 Symulacja rzutu kostką
# Scenariusz: Modelujesz zachowanie klientów kasyna dla celów analizy biznesowej.
# Stwórz funkcję kostka(n), która symuluje n rzutów kostką sześcienną.
# Użyj funkcji sample() i ustaw parametr replace na losowanie ze zwracaniem. 

kostka = function(n) { 
  wynik = sample(1:6,n,replace = TRUE)
  
  return (wynik)
} 
table(kostka(10))  
table(kostka(100))  
table(kostka(10000))  
