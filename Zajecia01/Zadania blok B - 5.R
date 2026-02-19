# Zadanie 5.	 System nagród
# Scenariusz: Projektujesz system lojalnościowy, w którym nagroda zależy od rzutu kostką.
# Stwórz funkcję przyznaj_nagrode(), która:
#   ???	Losuje liczbę 1-6 (symulacja jednorazowego rzutu kostką)
# ???	Jeśli wypadnie 6 › zwraca "Super bonus!"
# ???	Jeśli wypadnie 4 lub 5 › zwraca "Nagroda standardowa"
# ???	Jeśli wypadnie 1, 2 lub 3 › zwraca "Brak nagrody..."
przyznaj_nagrode=function() { 
  x = sample(1:6,1,replace=TRUE) 
  if(x==1 || x==2 || x==3) { 
    print("Brak nagrody...")
  }
  else if(x==4 || x==5) { 
    print("Nagroda standardowa")    
  }
  else{ 
    print("Super Bonus!")  
  }
  return(x) 
} 

przyznaj_nagrode()
przyznaj_nagrode()  
