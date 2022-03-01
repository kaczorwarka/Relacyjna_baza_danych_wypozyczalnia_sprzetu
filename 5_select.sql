select "imie i nazwisko", nr_faktury, trudnosc, 
round(sum("ilosc sprzetu")/sum(ilosc_uczestnikow)) as "ilosc sprzetu na uczestnika"
from podzial_sprzetu p
    where "imie i nazwisko" like '%ska'
    group by "imie i nazwisko", nr_faktury, trudnosc 
    having round(sum("ilosc sprzetu")/sum(ilosc_uczestnikow)) >(
        select round(sum("ilosc sprzetu")/sum(ilosc_uczestnikow)) as "ilosc sprzetu na uczestnika"
        from podzial_sprzetu s
            where s.trudnosc = p.trudnosc
            group by trudnosc)
;