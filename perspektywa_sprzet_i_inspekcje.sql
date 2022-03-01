create view sprzet_i_inspekcje as
select s.nr_egzemplarza,nazwa_sprzetu,data_inspekcji,imie||' '||nazwisko as "imie i nazwisko"
from inspekcja i
    join sprzet s on s.nr_egzemplarza = i.nr_egzemplarza
    join pracownik p on p.kod_pracownika = i.kod_pracownika
;