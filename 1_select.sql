select rownum,"imie i nazwisko", e_mail, "laczne wypozyczenie"
from(
    select *
        from ile_wypozyczen
        order by "laczne wypozyczenie" desc
)
where rownum < 4
and e_mail is not null
;