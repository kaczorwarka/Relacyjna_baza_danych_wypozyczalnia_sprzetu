select nr_egzemplarza,nazwa_sprzetu,round(avg((to_date('19/04/01','YY/MM/DD') - data_inspekcji))) as "czas od inspekcji"
from sprzet_i_inspekcje s
    where nazwa_sprzetu in ('Plecak','Okulary')
    group by nr_egzemplarza,nazwa_sprzetu
    having round(avg((to_date('19/04/01','YY/MM/DD') - data_inspekcji))) > (
        select round(avg((to_date('19/04/01','YY/MM/DD') - data_inspekcji))) as "czas od inspekcji"
        from sprzet_i_inspekcje i
        where s.nazwa_sprzetu = i.nazwa_sprzetu
    )
;