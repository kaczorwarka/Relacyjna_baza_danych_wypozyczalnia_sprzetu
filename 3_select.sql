select nazwa_sprzetu,cena, sum(cena) as "laczny przychod"
from sprzet s
    join wypozyczenia w on w.nr_egzemplarza = s.nr_egzemplarza
    where cena > 0.10*(
    select sum(cena) as "laczny przychod"
    from sprzet p
        join wypozyczenia w on w.nr_egzemplarza = p.nr_egzemplarza
        where s.nazwa_sprzetu = p.nazwa_sprzetu
        group by nazwa_sprzetu
    )
    group by nazwa_sprzetu,cena
;