
# 1. IMPORT----

kraje_1 = read.table("kraje_makro_1.csv", header=TRUE, sep=",", dec=".")
kraje_2 = read.table("kraje_makro_2.csv", header=TRUE, sep=",", dec=".")

#install.packages("readxl") 
library(readxl) 


# 2. PRZYGOTOWANIE DANYCH ----
# Podgl¹d danych ----

# Pierwsze/ostatnie wiersze
head(kraje_1)	# pierwsze 6 wierszy (obserwacji)
head(kraje_2)      

head(kraje_1, 10)	# pierwsze 10 wierszy (obserwacji)
head(kraje_2, 10)

tail(kraje_1, 5)	# ostatnie 5 wierszy (obserwacji)
tail(kraje_2, 5)


# Podstawowe statystyki wszystkich kolumn (zmiennych)
summary(kraje_1)	# min, max, œrednia, mediana, kwantyle
summary(kraje_2)

# Statystyki pojedynczej kolumny (zmiennej)
mean(kraje_1$Przyrost_populacji)		# œrednia
median(kraje_1$Przyrost_populacji)	# mediana
min(kraje_1$Przyrost_populacji)		# minimum
max(kraje_1$Przyrost_populacji)		# maksimum


# Porz¹dkowanie nazw kolumn (zmiennych) ----

# Usuwanie zbêdnej kolumny
kraje_1$X = NULL
kraje_2$X = NULL

# Zmiana nazw kolumn z angielskich na polskie
colnames(kraje_2) = c("Kod_kraju", "Nazwa", "Region", "Urbanizacja_proc.", "Internet_proc.")


# Porz¹dkowanie typów danych ----

# W ramce danych kraje_2 sprawdŸ typ zmiennej Region 
is.numeric(kraje_2$Region) 	# czy zmienna jest liczbowa? Odp. Nie.
is.character(kraje_2$Region) 	# czy zmienna jest tekstowa? Odp. Tak.

# Region to zmienna kategorialna, wiêc nadajemy jej typ factor:
kraje_2$Region = as.factor(kraje_2$Region)

# Sprawdzenie kategorii:
summary(kraje_2)
levels(kraje_2$Region)

# Teraz widaæ, ¿e jest 7 kategorii regionów, na których operuje zmienna Region.


# Porz¹dkowanie braków danych ----

# Szybka kontrola braków danych we wszystkich kolumnach:
colSums(is.na(kraje_1))	# nie ma braków danych
colSums(is.na(kraje_2))	# s¹ 4 braki danych w kolumnie (zmiennej) Internet_proc.

# Liczba braków w konkretnej kolumnie:
sum(is.na(kraje_2$Internet_proc.)) 	# 4 braki


# Zobaczmy te 4 wiersze, w których brakuje wartoœci:
kraje_2[is.na(kraje_2$Internet_proc.), ]


# Braki danych s¹ czêœci¹ rzeczywistoœci ekonomisty, dlatego trzeba umieæ je obs³u¿yæ i # podj¹æ decyzjê analityczn¹:
# OPCJA 1 - Pozostawiæ (teraz tak post¹pimy)
# OPCJA 2 - Usun¹æ obserwacje z brakami (czy usuniêcie tych obserwacji zmieni analizê?)
# OPCJA 3 - Uzupe³niæ braki (np. imputacja median¹)


# Czyszczenie danych ----
# W ramce danych kraje_2, w kolumnie Region s¹ kategorie, w których nazwie jest znak &:
levels(kraje_2$Region)
# [1] "East Asia & Pacific"       "Europe & Central Asia"    
# [3] "Latin America & Caribbean" "Middle East & North Africa"
# [5] "North America"             "South Asia"               
# [7] "Sub-Saharan Africa"

# Znak & bywa problematyczny przy dalszym przetwarzaniu, dlatego zast¹p go s³ownym spójnikiem "and".
# Funkcja gsub() dzia³a jak "ZnajdŸ i zamieñ" (Ctrl+H) w Excelu. 
# Zamienia wszystkie wyst¹pienia tekstu na inny tekst
# Przyk³adowo: gsub("stary_tekst", "nowy_tekst", ramka$kolumna)

# W naszym przypadku wykonamy nastêpuj¹cy kod:
kraje_2$Region <- gsub("&", "and", kraje_2$Region)

# Sprawdzenie (po zamianie ponownie ustawiamy typ factor):
kraje_2$Region = as.factor(kraje_2$Region)
levels(kraje_2$Region)

