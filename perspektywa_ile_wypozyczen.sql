create view ile_wypozyczen as
select imie ||' '|| nazwisko as "imie i nazwisko",e_mail,nvl(sum(ilosc_egzemplarzy),0) as "laczne wypozyczenie"
from klient k
    join faktura f on f.pesel = k.pesel
    left join faktura_dane d on d.nr_faktury = f.nr_faktury
    group by imie,nazwisko,e_mail;