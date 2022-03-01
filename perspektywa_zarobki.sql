create view zarobki as
select imie||' '||nazwisko as "imie i nazwisko", data_rozpoczecia,liczba_godzin_pracy, z.zakres_dzialan, wynagrodzenie
from pracownik p
    join zakres_obowiazkow z on p.kod_pracownika = z.kod_pracownika
    join obowiazki o on z.zakres_dzialan = o.zakres_dzialan
    ;