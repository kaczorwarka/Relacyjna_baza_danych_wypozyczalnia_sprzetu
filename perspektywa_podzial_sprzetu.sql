create view podzial_sprzetu as 
select imie||' '||nazwisko as "imie i nazwisko", f.nr_faktury, 
dlugosc_trasy,trudnosc,ilosc_uczestnikow,
nvl(sum(ilosc_egzemplarzy),0) as "ilosc sprzetu",nvl(sum(cena_wypozyczenia),0) as "cena sprzetu"
from faktura f
    join klient k on k.pesel = f.pesel
    join wycieczka w on w.nr_faktury = f.nr_faktury
    left join faktura_dane d on d.nr_faktury = f.nr_faktury
    where trudnosc in ('srednia','latwa')
    group by imie||' '||nazwisko, f.nr_faktury, dlugosc_trasy,trudnosc,ilosc_uczestnikow
    ;