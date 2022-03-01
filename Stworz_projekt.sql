
CREATE TABLE faktura (
    nr_faktury   NUMBER(4) NOT NULL,
    data_wydania DATE NOT NULL,
    wartosc      NUMBER(5) NOT NULL,
    pesel        NUMBER(11) NOT NULL
);

ALTER TABLE faktura ADD CONSTRAINT faktura_pk PRIMARY KEY ( nr_faktury );

CREATE TABLE faktura_dane (
    nr_pozycji        NUMBER(2) NOT NULL,
    ilosc_egzemplarzy NUMBER(2) NOT NULL,
    cena_wypozyczenia NUMBER(4) NOT NULL,
    nr_faktury        NUMBER(4) NOT NULL
);

ALTER TABLE faktura_dane ADD CONSTRAINT faktura_dane_pk PRIMARY KEY ( nr_pozycji,
                                                                      nr_faktury );

CREATE TABLE inspekcja (
    kod_pracownika NUMBER(2) NOT NULL,
    nr_egzemplarza NUMBER(5) NOT NULL,
    data_inspekcji DATE NOT NULL
);

ALTER TABLE inspekcja ADD CONSTRAINT inspekcja_pk PRIMARY KEY ( kod_pracownika,
                                                                nr_egzemplarza );

CREATE TABLE klient (
    pesel       NUMBER(11) NOT NULL,
    imie        VARCHAR2(20) NOT NULL,
    nazwisko    VARCHAR2(40) NOT NULL,
    nr_telefonu NUMBER(9) NOT NULL,
    e_mail      VARCHAR2(40)
);

ALTER TABLE klient ADD CONSTRAINT klient_pk PRIMARY KEY ( pesel );

CREATE TABLE konto (
    login          VARCHAR2(20) NOT NULL,
    haslo          VARCHAR2(10) NOT NULL,
    platforma      VARCHAR2(50) NOT NULL,
    kod_pracownika NUMBER(2) NOT NULL
);

ALTER TABLE konto ADD CONSTRAINT konto_pk PRIMARY KEY ( login );

CREATE TABLE obowiazki (
    zakres_dzialan VARCHAR2(30) NOT NULL,
    wynagrodzenie  NUMBER(3) NOT NULL
);

ALTER TABLE obowiazki ADD CONSTRAINT obowiazki_pk PRIMARY KEY ( zakres_dzialan );

CREATE TABLE pracownik (
    kod_pracownika      NUMBER(2) NOT NULL,
    imie                VARCHAR2(20) NOT NULL,
    nazwisko            VARCHAR2(40) NOT NULL,
    liczba_godzin_pracy NUMBER(3) NOT NULL,
    data_rozpoczecia    DATE NOT NULL
);

ALTER TABLE pracownik ADD CONSTRAINT pracownik_pk PRIMARY KEY ( kod_pracownika );

CREATE TABLE sprzet (
    nr_egzemplarza         NUMBER(5) NOT NULL,
    nazwa_sprzetu          VARCHAR2(50) NOT NULL,
    cena                   NUMBER(2) NOT NULL,
    data_ostatniej_naprawy DATE
);

ALTER TABLE sprzet ADD CONSTRAINT sprzet_pk PRIMARY KEY ( nr_egzemplarza );

CREATE TABLE wycieczka (
    dlugosc_trasy     NUMBER(3) NOT NULL,
    trudnosc          VARCHAR2(20) NOT NULL,
    czas_przejscia    NUMBER(3) NOT NULL,
    poczotek          VARCHAR2(50) NOT NULL,
    kod_pracownika    NUMBER(2) NOT NULL,
    koniec            VARCHAR2(50) NOT NULL,
    cena_wycieczki    NUMBER(4) NOT NULL,
    ilosc_uczestnikow NUMBER(2) NOT NULL,
    nr_faktury        NUMBER(4) NOT NULL
);

ALTER TABLE wycieczka
    ADD CHECK ( trudnosc IN ( 'latwa', 'srednia', 'trudna' ) );

ALTER TABLE wycieczka ADD CONSTRAINT wycieczka_pk PRIMARY KEY ( nr_faktury );

CREATE TABLE wypozyczenia (
    nr_faktury        NUMBER(4) NOT NULL,
    nr_pozycji        NUMBER(2) NOT NULL,
    nr_egzemplarza    NUMBER(5) NOT NULL,
    data_wypozyczenia DATE NOT NULL
);

ALTER TABLE wypozyczenia
    ADD CONSTRAINT wypozyczenia_pk PRIMARY KEY ( nr_pozycji,
                                                 nr_faktury,
                                                 nr_egzemplarza );

CREATE TABLE zakres_obowiazkow (
    kod_pracownika NUMBER(2) NOT NULL,
    zakres_dzialan VARCHAR2(30) NOT NULL
);

ALTER TABLE zakres_obowiazkow ADD CONSTRAINT zakres_obowiazkow_pk PRIMARY KEY ( kod_pracownika,
                                                                                zakres_dzialan );

ALTER TABLE faktura_dane
    ADD CONSTRAINT faktura_dane_faktura_fk FOREIGN KEY ( nr_faktury )
        REFERENCES faktura ( nr_faktury );

ALTER TABLE faktura
    ADD CONSTRAINT faktura_klient_fk FOREIGN KEY ( pesel )
        REFERENCES klient ( pesel );

ALTER TABLE inspekcja
    ADD CONSTRAINT inspekcja_pracownik_fk FOREIGN KEY ( kod_pracownika )
        REFERENCES pracownik ( kod_pracownika );

ALTER TABLE inspekcja
    ADD CONSTRAINT inspekcja_sprzet_fk FOREIGN KEY ( nr_egzemplarza )
        REFERENCES sprzet ( nr_egzemplarza );

ALTER TABLE konto
    ADD CONSTRAINT konto_pracownik_fk FOREIGN KEY ( kod_pracownika )
        REFERENCES pracownik ( kod_pracownika );

ALTER TABLE wycieczka
    ADD CONSTRAINT wycieczka_faktura_fk FOREIGN KEY ( nr_faktury )
        REFERENCES faktura ( nr_faktury );

ALTER TABLE wycieczka
    ADD CONSTRAINT wycieczka_pracownik_fk FOREIGN KEY ( kod_pracownika )
        REFERENCES pracownik ( kod_pracownika );

ALTER TABLE wypozyczenia
    ADD CONSTRAINT wypozyczenia_faktura_dane_fk FOREIGN KEY ( nr_pozycji,
                                                              nr_faktury )
        REFERENCES faktura_dane ( nr_pozycji,
                                  nr_faktury );

ALTER TABLE wypozyczenia
    ADD CONSTRAINT wypozyczenia_sprzet_fk FOREIGN KEY ( nr_egzemplarza )
        REFERENCES sprzet ( nr_egzemplarza );

ALTER TABLE zakres_obowiazkow
    ADD CONSTRAINT zakres_obowiazkow_obowiazki_fk FOREIGN KEY ( zakres_dzialan )
        REFERENCES obowiazki ( zakres_dzialan );

ALTER TABLE zakres_obowiazkow
    ADD CONSTRAINT zakres_obowiazkow_pracownik_fk FOREIGN KEY ( kod_pracownika )
        REFERENCES pracownik ( kod_pracownika );




