select "imie i nazwisko"
from(
    select "imie i nazwisko", round((sysdate - data_rozpoczecia)) as "czas_pracy"
        from zarobki
        order by "czas_pracy" desc
)
where rownum = 1

union


select "imie i nazwisko"
from(
    select "imie i nazwisko", liczba_godzin_pracy * "czas_pracy" * "laczne wyngrodzenie" as "wynagrodzenie za cala prace"
    from(
        select "imie i nazwisko",liczba_godzin_pracy,round((sysdate - data_rozpoczecia)/30)as "czas_pracy", 
        sum(wynagrodzenie) as "laczne wyngrodzenie"
            from zarobki
            group by "imie i nazwisko",liczba_godzin_pracy,round((sysdate - data_rozpoczecia)/30)
    )
        order by "wynagrodzenie za cala prace" desc
)where rownum = 1
;

