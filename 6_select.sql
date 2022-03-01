select imie||' '|| nazwisko as "imie i nazwisko",data_wydania,data_ostatniej_naprawy,s.nr_egzemplarza
from faktura f
    join klient k on k.pesel = f.pesel
    join faktura_dane d on d.nr_faktury = f.nr_faktury
    join wypozyczenia w on w.nr_faktury = d.nr_faktury and w.nr_pozycji = d.nr_pozycji
    join sprzet s on s.nr_egzemplarza = w.nr_egzemplarza
        where data_ostatniej_naprawy is not null
        and data_ostatniej_naprawy > data_wydania
        and data_wydania in (
            select max(data_wydania) as "ostatnie wydanie przed naprawa"
            from faktura f
                join faktura_dane d on d.nr_faktury = f.nr_faktury
                join wypozyczenia w on w.nr_faktury = d.nr_faktury and w.nr_pozycji = d.nr_pozycji
                join sprzet p on p.nr_egzemplarza = w.nr_egzemplarza
                    where p.nr_egzemplarza = s.nr_egzemplarza
                    and data_ostatniej_naprawy is not null
                    and data_ostatniej_naprawy > data_wydania
                          group by p.nr_egzemplarza
        )
;