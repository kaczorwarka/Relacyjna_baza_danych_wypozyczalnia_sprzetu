# Baza_wypozyczalnia_sprzetu
* [generalne informacje](generalne_ifnormacje)
* [krótki opis](krótki_opis)
* [instrukcja instalacji](instrukcja_isntalacji)
* [opis perspektyw](opis_perspektyw)
* [opis selectów](opis_selectow)

## generalne informacje  
Projekt przedstawia bazę danych ,z okresu styczeń – marzec 2019,  
biura organizującego wycieczki górskie oraz dającego możliwość  
wypożyczenia na okres ich trwania podstawowego sprzętu górskiego.  
Składa się ona z 11 encji:  
•	Klient   
•	Pracownik  
•	Obowiazki  
•	Sprzet  
•	Zakres_obowiazkow  
•	Konto  
•	Inspekcja  
•	Faktura  
•	Wycieczka  
•	Faktura_dane  
•	Wypozyczenia  

## krótki opis  
Dany klient może wykupić wiele wycieczek (połączenie Klient z  
Faktura 1:N oraz Faktura z Wycieczka 1:N). Dodatkowo klient może  
do danego zamówienia wypożyczyć podstawowy sprzęt górski  
(połączenie Faktura z Faktura_dane 1:N). Aby wycieczka mogła się  
odbyć potrzebuje ona przewodnika (połączenie Wycieczka z  
Pracownik N:1). Do danego zamówienie może zostać wypożyczone  
wiele egzemplarzy tego samego i różnego rodzaju np. 2 kaski i 1  
plecak (połączenie Faktura_dane z Sprzęt N:M). Ponieważ między  
tabelami Faktura_dane i Sprzęt jest połączenie wiele do wielu  
wprowadzona została nowa tabela Wypozyczenia określająca kiedy i  
komu dany egzemplarz sprzętu został wypożyczony. Dany pracownik  
ma dostęp do jednego lub wielu kont pomagających mu w pracy  
(połączenie Pracownik z Konto 1:N), z góry określoną liczbę godzin  
pracy w ciągu miesiąca oraz swoje obowiązki o różnych stawkach  
godzinowych. Jako że dany pracownik może mieć kilka obowiązków  
(połączenie Pracownik z Obowiązki N:M) ,przy czym sumują się stawki  
godzinowe, wprowadzona została tabela Zakres_obowiazkow  
określająca kto jakie ma obowiązki. Część pracowników  
przeprowadza również inspekcje sprzętu które mogą (ale nie muszą)  
skończyć się jego naprawa.  

## instrukcja instalacji  
Relacyjna baza danych została stworzona za pomocą sqldeveloper.  
Pliki z tabelami oraz danymi do nich należy instalować za pomocą  
tego narzędziaw następującej kolejności:  
•	@C:\temp\Stworz_projekt;  
•	@C:\temp\Klient_insert;  
•	@C:\temp\Pracownik_insert;  
•	@C:\temp\Obowiazki_insert;  
•	@C:\temp\Zakres_obowiazkow_insert;  
•	@C:\temp\Konto_insert;  
•	@C:\temp\Sprzet_insert;  
•	@C:\temp\Inspekcja_insert;  
•	@C:\temp\Faktura_insert;  
•	@C:\temp\Wycieczka_insert;  
•	@C:\temp\Faktura_dane_insert;  
•	@C:\temp\Wypozyczenia_insert;  
Po zainstalowaniu projektu wraz z danymi należy utworzyć  
perspektywy:
•	@C:\temp\perspektywa_ile_wypozyczen;  
•	@C:\temp\perspektywa_podzial_sprzetu;  
•	@C:\temp\perspektywa_sprzet_i_inspekcje;  
•	@C:\temp\perspektywa_zarobki;  
Na koniec można wykonać zdania select:  
•	@C:\temp\1_select;  
•	@C:\temp\2_select;  
•	@C:\temp\3_select;  
•	@C:\temp\4_select;  
•	@C:\temp\5_select;  
•	@C:\temp\6_select;  
W celu usunięcia całego projektu należy wykonać @C:\temp\Usun_projekt;  

## opis perspektyw
Perspektywa Ile_wypozyczen pokazuje ile łącznie każdy klient (imię i  
nazwisko) wypożyczył sprzętu. Przechowuje również e-mail każdego  
klienta (jeżeli został podany).  
  
Perspektywa Podzial_sprzetu pokazuje ile sprzętu i za jaką cenę(ilość  
i łączna cena sprzętu) dany klient (imie i nazwisko) wypożyczył na  
wycieczkę (nr_faktury, dlugosc_trasy, trudnosc oraz  
ilosc_uczestnikow) jednak tylko dla wycieczek łatwych oraz średnich.  
    
Perspektywa sprzet_i_inspekcje określa kto i kiedy przeprowadzał  
inspekcje (imie i nazwisko oraz data_inspekcji) danego sprzętu  
(nr_egzemplarza i nazwa_sprzetu).  
  
Perspektywa Zarobki pokazuje jaki pracownik (imię i nazwisko,  
data_rozpoczecia oraz liczba_godzin_pracy) jakie ma obowiązki  
(zakres_dzialan, wynagrodzenie).  

## opis selectów  
Pierwsze zdanie select działa na perspektywie Ile_wypozyczen.  
Pokazuje ono 3 osoby o największej liczbie wypożyczonego sprzętu  
które mają swój e-mail zapisany w bazie.  
  
Drugie zdanie select działa na perspektywie Zarobki. Pokazuje ono  
pracownika (imię i nazwisko) o największym łącznym dochodzie od  
momentu rozpoczęcia pracy do dzisiaj oraz pracownika o najdłuższym  
stażu w pracy (zakładając że stan pracowników nie zmienił się do dnia  
dzisiejszego).  
  
Trzecie zdanie select pokazuje dla których rodzajów sprzętu  
(nazwa_sprzetu) ich cena za wypożyczenie (cena) przewyższa 10%  
łącznego przychodu (laczny przychod) z wypożyczania danego rodzaju  
sprzętu.  
  
Czwarte zdanie select  działa na perspektywie Sprzet_i_inspekcje.  
Pokazuje które plecaki i okulary (nr_egzemplarza, nazwa_sprzetu) nie  
miały inspekcji (czas od inspekcji) dłużej niż średni czas oczekiwania  
na inspekcje dla tych rodzajów sprzętu.  
  
Piąte zdanie select działa na perspektywie Podzial_sprzetu. Pokazuje  
które kobiety w danym zamówieniu (imie i nazwisko oraz nr_faktury)  
wypożyczyły więcej w przeliczeniu na jednego uczestnika (ilosc  
sprzętu na uczestnika) niż przypada takiego sprzętu dla całego  
poziomu trudności.  
  
Szóste zdanie select pokazuje które osoby (imie i nazwisko) jako  
ostatnie wypożyczyły dany sprzęt przed jego naprawą (data_wydania,  
data_ostatniej_naprawy, nr_egzemplarza).




