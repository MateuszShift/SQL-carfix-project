
--Tworzenie tablicy Klientow
CREATE TABLE Klienci( -- nie wiadomo czy dlugosci sa poprawnie zapisane
    Id_klienta INT PRIMARY KEY CHECK (Id_klienta >=100000000 AND Id_klienta <=999999999) NOT NULL,
    Imie NVARCHAR(20) NOT NULL , --dodac ograniczenie z wielka litera na poczatku
    Nazwisko NVARCHAR(20) NOT NULL CHECK (Nazwisko LIKE N'[A-ZĄĆĘŁŃÓŚŹŻ]%' AND (Nazwisko NOT LIKE N'%[^A-ZĄĆĘŁŃÓŚŹŻa-ząćęłńóśźż]%') AND LEN(Nazwisko) BETWEEN 2 AND 20),
    Numer_telefonu NVARCHAR(9) NOT NULL CHECK (LEN(Numer_telefonu) = 9 AND Numer_telefonu LIKE N'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') --nie wiadomo czy moge tak
    );

--Tworzenie tablicy Samochodów
CREATE TABLE Samochody(
    VIN NVARCHAR(17) PRIMARY KEY CHECK(LEN(VIN) = 17 AND VIN LIKE N'[A-Z0-9]%' AND VIN LIKE N'%[A-Z0-9]%' AND VIN LIKE N'%[A-Z0-9]') NOT NULL,
    Marka NVARCHAR(20) CHECK (LEN(Marka) BETWEEN 2 AND 20 AND Marka LIKE N'[A-Z]%') NOT NULL,
    Model NVARCHAR(20) CHECK (LEN(Model) BETWEEN 2 AND 20 AND Model LIKE N'[A-Z0-9]%') NOT NULL,
    Rocznik INT CHECK (Rocznik >= 1899 AND Rocznik <= 9999) NOT NULL,
    Przebieg INT CHECK (Przebieg >=0 AND Przebieg <=10000000) NOT NULL,
    Silnik NVARCHAR(20) CHECK (LEN(Silnik) BETWEEN 3 AND 20 AND Silnik LIKE N'[A-Z0-9]%') NOT NULL,
    Typ_nadwozia NVARCHAR(20) CHECK (LEN(Typ_nadwozia) BETWEEN 3 AND 20 AND Typ_nadwozia LIKE N'[A-Z]%') NOT NULL,
    Moc INT CHECK (Moc >=1 AND Moc <=5000) NOT NULL
);

--Tworzenie tablicy Mechanikow

CREATE TABLE Mechanicy(
    Id_pracownika INT PRIMARY KEY CHECK (Id_pracownika >=1 AND Id_pracownika <=1000) NOT NULL,
    Pesel NVARCHAR(11) CHECK (LEN(Pesel) = 11 AND Pesel LIKE N'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')NOT NULL,
    Numer_telefonu NVARCHAR(9) NOT NULL CHECK (LEN(Numer_telefonu) = 9 AND Numer_telefonu LIKE N'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Miasto NVARCHAR(30) NOT NULL CHECK (Miasto LIKE N'[A-ZĄĆĘŁŃÓŚŹŻ]%' AND (Miasto NOT LIKE N'%[^A-ZĄĆĘŁŃÓŚŹŻa-ząćęłńóśźż]%') AND LEN(Miasto) BETWEEN 2 AND 30),
    Ulica NVARCHAR(30) NOT NULL CHECK (Ulica LIKE N'[A-ZĄĆĘŁŃÓŚŹŻ]%' AND (Ulica NOT LIKE N'%[^A-ZĄĆĘŁŃÓŚŹŻa-ząćęłńóśźż]%') AND LEN(Ulica) BETWEEN 2 AND 30),
    Imie NVARCHAR(20) NOT NULL CHECK (Imie LIKE N'[A-ZĄĆĘŁŃÓŚŹŻ]%' AND (Imie NOT LIKE N'%[^A-ZĄĆĘŁŃÓŚŹŻa-ząćęłńóśźż]%') AND LEN(Imie) BETWEEN 2 AND 20),
    Nazwisko NVARCHAR(20) NOT NULL CHECK (Nazwisko LIKE N'[A-ZĄĆĘŁŃÓŚŹŻ]%' AND (Nazwisko NOT LIKE N'%[^A-ZĄĆĘŁŃÓŚŹŻa-ząćęłńóśźż]%') AND LEN(Nazwisko) BETWEEN 2 AND 20),
);

--Tworzenie tablicy Rejestru przyjec i odbiorów

CREATE TABLE Rejestr_przyjec_i_odbiorow(
    Godzina_przyjecia TIME  NOT NULL,
    Godzina_odbioru TIME,
    Czy_umowiony BIT NOT NULL,
    Numer_zlecenia NVARCHAR(17) PRIMARY KEY CHECK (LEN(Numer_zlecenia) = 7) NOT NULL,
    Data_przyjecia DATE CHECK (MONTH(Data_przyjecia) <= 12 AND DAY(Data_przyjecia) <= 31) NOT NULL,
    Data_odbioru DATE CHECK (MONTH(Data_odbioru) <= 12 AND DAY(Data_odbioru) <= 31),
    Data_planowanego_odbioru DATE CHECK (MONTH(Data_planowanego_odbioru) <= 12 AND DAY(Data_planowanego_odbioru) <= 31),
    Godzina_planowanego_odbioru TIME,
    Id_klienta INT NOT NULL,
    Id_samochodu NVARCHAR(17) NOT NULL,
    FOREIGN KEY (Id_klienta) REFERENCES Klienci(Id_klienta) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Id_samochodu) REFERENCES Samochody(VIN) 
);

--Tworzenie tablicy Urlopow

CREATE TABLE Urlopy(
    Id INT PRIMARY KEY CHECK (Id >= 0 AND Id <= 999999) NOT NULL,
    Rodzaj NVARCHAR(60) CHECK(Rodzaj IN('Urlop wypoczynkowy', 'Urlop zdrowotny', 'Urlop macierzyński/urlop rodzicielski', 'Urlop szkoleniowy', 'Urlop natychmiastowy', 'Urlop bezpłatny')) NOT NULL,
    Data_rozpoczecia DATE CHECK ((MONTH(Data_rozpoczecia) <= 12) AND DAY(Data_rozpoczecia) <=31),
    Data_zakonczenia DATE CHECK ((MONTH(Data_zakonczenia) <= 12) AND DAY(Data_zakonczenia) <=31),
    Id_pracownika INT NOT NULL,
    FOREIGN KEY (Id_pracownika) REFERENCES Mechanicy(Id_pracownika)
);

--Tworzenie tablicy Zmian

CREATE TABLE Zmiany(
    Id_zmiany INT PRIMARY KEY CHECK(Id_zmiany >=0 AND Id_zmiany <=9999999) NOT NULL,
    Godzina_rozpoczecia TIME NOT NULL,
    Godzina_zakonczenia TIME NOT NULL,
    Data_rozpoczecia DATE CHECK ((MONTH(Data_rozpoczecia) <= 12) AND DAY(Data_rozpoczecia) <=31),
    Data_zakonczenia DATE CHECK ((MONTH(Data_zakonczenia) <= 12) AND DAY(Data_zakonczenia) <=31),
    Id_pracownika INT NOT NULL,
    FOREIGN KEY (Id_pracownika) REFERENCES Mechanicy(Id_pracownika)
);

--Tworzenie tablicy Przegladow

CREATE TABLE Przeglady(
    Numer_przegladu INT PRIMARY KEY CHECK(Numer_przegladu>=0 AND Numer_przegladu <=99999) NOT NULL,
    Data_przegladu DATE NOT NULL,
    Uwagi NVARCHAR(180) CHECK (Uwagi LIKE N'[A-Z]%' AND LEN(Uwagi) BETWEEN 3 AND 180) NOT NULL,
    Wynik BIT NOT NULL,
    Id_samochodu NVARCHAR(17) NOT NULL,
    FOREIGN KEY (Id_samochodu) REFERENCES Samochody(VIN)
);

--Tworzenie tablicy Napraw

CREATE TABLE Naprawy(
    Id_naprawy INT PRIMARY KEY CHECK(Id_naprawy >= 0 AND Id_naprawy <= 999999) NOT NULL,
    Stanowisko INT CHECK(Stanowisko >= 0 AND Stanowisko <= 20) NOT NULL,
    Uwagi NVARCHAR(180) CHECK (Uwagi LIKE N'[A-Z]%' AND LEN(Uwagi) BETWEEN 3 AND 180),
    Data_rozpoczecia DATE CHECK((MONTH(Data_rozpoczecia) <= 12) AND DAY(Data_rozpoczecia) <=31) NOT NULL,
    Data_zakonczenia DATE CHECK ((MONTH(Data_zakonczenia) <= 12) AND DAY(Data_zakonczenia) <=31),
    Id_samochodu NVARCHAR(17) NOT NULL,
    Id_pracownika INT NOT NULL,
    FOREIGN KEY (Id_samochodu) REFERENCES Samochody(VIN), 
    FOREIGN KEY (Id_pracownika) REFERENCES Mechanicy(Id_pracownika), 
);

--Tworzenie tablicy Dostawcow czesci

CREATE TABLE Dostawcy_czesci(
    Numer_zlecenia INT PRIMARY KEY CHECK (Numer_zlecenia>=0 AND Numer_zlecenia <=999999) NOT NULL,
    Nazwa NVARCHAR(20) CHECK (Nazwa LIKE N'[A-ZĄĆĘŁŃÓŚŹŻ]%' AND Nazwa LIKE N'%[A-ZĄĆĘŁŃÓŚŹŻa-ząćęłńóśźż0-9]%' AND LEN(Nazwa) BETWEEN 3 AND 20) NOT NULL,
    Specjalizacja NVARCHAR(40) CHECK (Specjalizacja IN ('Filtry','Układ hamulcowy','Rozrząd','Układ napędowy','Oświetlenie','Układ zawieszenia','Chłodzenie','Układ elektryczny','Opony','Układ wydechowy')) NOT NULL,
    Termin_dostaw DATE CHECK ((MONTH(Termin_dostaw) <= 12) AND DAY(Termin_dostaw) <=31) NOT NULL
);

--Tworzenie tablicy Częsci samochodowych

CREATE TABLE Czesci_samochodowe(
    Numer_seryjny NVARCHAR(30) PRIMARY KEY CHECK(Numer_seryjny LIKE N'[A-Z0-9]%' AND Numer_seryjny LIKE N'%[A-Z0-9]%' AND Numer_seryjny LIKE N'%[A-Z0-9]' AND LEN(Numer_seryjny) BETWEEN 1 AND 30)NOT NULL,
    Nazwa NVARCHAR(60) CHECK((Nazwa LIKE N'[A-ZĄĆĘŁŃÓŚŹŻa-z0-9]%' AND (Nazwa LIKE N'%[A-ZĄĆĘŁŃÓŚŹŻa-ząćęłńóśźż0-9]%') AND LEN(Nazwa) BETWEEN 3 AND 60)) NOT NULL,
    Rok_produkcji INT CHECK (Rok_produkcji >=1899 AND Rok_produkcji <= 9999)NOT NULL,
    Id_czesci INT NOT NULL,
    FOREIGN KEY (Id_czesci) REFERENCES Dostawcy_czesci(Numer_zlecenia) 
);

--Tworzenie tablicy Wykorzystanych czesci

CREATE TABLE Ilosc_zuzytych_czesci(
    Numer_faktury_serwisowej INT PRIMARY KEY CHECK (Numer_faktury_serwisowej >= 1 AND Numer_faktury_serwisowej <=100000) NOT NULL,
    Uwagi NVARCHAR(180) CHECK(Uwagi LIKE N'[A-Z]%' AND LEN(Uwagi) BETWEEN 3 AND 180) NOT NULL,
    Stan_czesci NvARCHAR(15) CHECK (Stan_czesci LIKE N'[A-Z]%' AND Stan_czesci LIKE N'%[A-ZĄĆĘŁŃÓŚŹŻa-ząćęłńóśźż0-9]%' AND LEN(Stan_czesci) BETWEEN 3 AND 15) NOT NULL,
    Ilosc INT CHECK(Ilosc >=0 AND Ilosc <=1000) NOT NULL,
    Id_czesci NVARCHAR(30) NOT NULL,
    Id_naprawy INT NOT NULL,
    FOREIGN KEY (Id_czesci) REFERENCES Czesci_samochodowe(Numer_seryjny),
    FOREIGN KEY (Id_naprawy) REFERENCES Naprawy(Id_naprawy)
);


