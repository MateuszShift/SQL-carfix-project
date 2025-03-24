--dodawanie wartosci poprawnych do Klienci
INSERT INTO Klienci (Id_klienta, Imie, Nazwisko, Numer_telefonu)
    VALUES 
           (100000001, 'Karol', 'Nowakowski', '998877321'),
           (100000002,'Mateusz','Krówka','605403787'),
           (100000003,'Bartosz','Trelka','750843754'),
           (100000004,'Marta','Stopik','573829416'),
           (100000005,'Julia','Nowak','920174625'),
           (100000006,'Mariusz','Kowalski','184605327'),
           (100000007,'Jakub','Nowaczko','761598432'),
           (100000008,'Maciej','Skóra','305817249'),
           (100000009,'Tomasz','Dziób','649283571'),
           (100000010,'Mariola','Tomczyk','829651934'),
           (100000011,'Jacek','Placek','502369814'),
           (100000012,'Konrad','Stawek','316584207'),
           (100000013,'Rudolf','Gunter','498217563'),
           (100000014,'Marek','Tracz','735926180'),
           (100000015,'Julian','Dobry','267914583'),
           (100000016,'Konrad','Berkowicz','854619732'),
           (100000017,'Donald','Komin','437964286'),
           (100000018,'Dominika','Kopczyk','905831743'),
           (100000019,'Mariusz','Sówka','612257159'),
           (100000020,'Tomasz','Kot','518467929');

--koniec dodawania wartosci poprawnych do Klienci
--dodawanie wartosci niepoprawnych do Klienci
INSERT INTO Klienci (Id_klienta,Imie,Nazwisko,Numer_telefonu)
    VALUES (1000000021,'Roman','Gracz','987654321'); --za dlugie id
INSERT INTO Klienci (Id_klienta,Imie,Nazwisko,Numer_telefonu)
    VALUES (100000022,'Mark','Twaeinstaingierersson','563721823'); --za dlugie nazwisko
INSERT INTO Klienci (Id_klienta,Imie,Nazwisko,Numer_telefonu)
    VALUES (100000023,'Karol','Karas','43621897a'); --blad w telefonie
--koniec dodawania wartosci niepoprawnych do Klienci

--dodawanie poprawne do Samochody

INSERT INTO Samochody (VIN, Marka,Model,Rocznik, Przebieg, Silnik, Typ_nadwozia, Moc)
    VALUES ('1GNEK13Z22J231291', 'Seat', 'Ibiza FR', 2014, 227345,'2.0 TDI', 'Coupe',143),
           ('JH4DB1660SS006112','Skoda', 'Octavia', 2019, 76893, '1.5 TSI', 'Combi', 150),
           ('WBAAV53491FJ91522', 'Toyota', 'Yaris', 2020, 45391, '1.5 TSI DC', 'Hetchback', 115),
           ('3VW507AT5FM808950', 'Ferrari', 'Spider', 2019,13987,'4.0 V8 CT', 'Cabriolet', 518),
           ('KMHJF35F3WU152863','Skoda','Octavia',1990,346321,'1.2 TSI','Sedan',100),
           ('1FAFP55U41A242604','Toyota', 'Auris', 2005, 178456, '1.6 TDI', 'Hatchback', 123),
           ('1N4AL11D96C210056', 'Seat', 'Toledo', 2003,274971, '1.9 TDI', 'Sedan', 92),
           ('5NPEB4AC1DH803722', 'BMW', 'M4', 2021, 32890, '3.3 V6', 'Sedan', 365),
           ('2G1WF52K449313177', 'Audi', 'Q5', 2018, 45673,'2.0 TFSI', 'SUV', 212),
           ('5FNYF3H56FB002040','Maseratti', 'Ghibli', 2016, 56392,'3.0 V6', 'Sedan', 345),
           ('1NXBR32E87Z851542','Subaru', 'Impreza', 2012, 98732, '2.0 TSI', 'Hetchback', 239),
           ('JM1BK32F191227305','Suzuki', 'Grand Vitara', 2010, 180335, '1.8 TFSI', 'SUV', 158),
           ('1HGCM82633A033131','Peugeot', '307cc', 2006, 178654, '1.6 HDI', 'Cabriolet', 122),
           ('WBAEW534X4PN35374','Lancia','Delta Integrale', 1986, 134987, '1.8 T','Hatchback',178),
           ('1FTZR15E25PA76371','Volkswagen', 'Passat', 2013, 297553, '2.0 TDI', 'Combi',140),
           ('5N1AR18W89C601636','Mitsubishi', 'Spacestar', 1999, 250980, '1.3 HDI', 'Minivan', 75),
           ('4T1BE32K13U730150','Fiat', 'Punto', 2015, 124790, '1.4 TSI', 'Hatchback', 75),
           ('JHMCG56442C013610','Skoda', 'Superb', 2018, 67219, '2.0 TSI', 'Liftback', 190),
           ('3N1AB6AP8AL675826','Porsche','Panamera', 2015, 24590, '4.2 V6', 'Liftback', 350),
           ('1GNFK13058R215926','Fiat', '126p', 1978, 99540, '0.8', 'Fastback', 24);

--dodawania niepoprawne do samochody

INSERT INTO Samochody (VIN, Marka,Model,Rocznik, Przebieg, Silnik, Typ_nadwozia, Moc)
    VALUES ('1GNEK13Z22J2312910', 'Seat', 'Ibiza FR', 2014, 227345,'2.0 TDI', 'Coupe',143); --zly VIN

INSERT INTO Samochody (VIN, Marka,Model,Rocznik, Przebieg, Silnik, Typ_nadwozia, Moc)
    VALUES ('1GNEK13Z22J231281', '0Seat', 'Ibiza FR', 2014, 227345,'2.0 TDI', 'Coupe',143); --blad w marce

INSERT INTO Samochody (VIN, Marka,Model,Rocznik, Przebieg, Silnik, Typ_nadwozia, Moc)
    VALUES ('1GNEK13Z22J231271', 'Seat', 'Ibiza FRooooooooooooo', 2014, 227345,'2.0 TDI', 'Coupe',143); --zbyt dluga nazwa 

INSERT INTO Samochody (VIN, Marka,Model,Rocznik, Przebieg, Silnik, Typ_nadwozia, Moc)
    VALUES ('1GNEK13Z22J2312610', 'Seat', 'Ibiza FR', 10000, 227345,'2.0 TDI', 'Coupe',143); --rocznik zly

INSERT INTO Samochody (VIN, Marka,Model,Rocznik, Przebieg, Silnik, Typ_nadwozia, Moc)
    VALUES ('1GNEK13Z22J2312510', 'Seat', 'Ibiza FR', 2014, 22700345,'2.0 TDI', 'Coupe',143); --zakres przebiegu

INSERT INTO Samochody (VIN, Marka,Model,Rocznik, Przebieg, Silnik, Typ_nadwozia, Moc)
    VALUES ('1GNEK13Z22J2312410', 'Seat', 'Ibiza FR', 2014, 227345,'2.0 TDI', 'Coupe',5001); --moc 


--dodawanie poprawne do Mechanicy

INSERT INTO Mechanicy (Id_pracownika, Pesel, Numer_telefonu, Miasto, Ulica, Imie, Nazwisko)
    VALUES(1,'09321678322', '679321788', 'Sopot', 'Topolowa', 'Marian', 'Papier'),
          (2,'87327783226', '678329165', 'Gdynia', 'Wiejska', 'Ryszard', 'Kowalski'),
          (3,'08366219002', '980321674', 'Rusocin', 'Topolowa', 'Tadeusz', 'Majcher'),
          (4,'78326673283', '321879312', 'Straszyn', 'Grunwaldzka', 'Mateusz', 'Pióro'),
          (5,'63219888329', '567843291', 'Kwidzyn', 'Mariacka', 'Karol', 'Zdep'),
          (6,'93217896642', '897321742', 'Gdynia', 'Lechistów', 'Fabian', 'Lukaj'),
          (7,'78932178983', '326781944', 'Sopot', 'Polegiów', 'Waldemar', 'Kowal'),
          (8,'87632196866', '777829919', 'Gdynia', 'Mandarynkowa', 'Mariusz', 'Kulas'),
          (9,'83737737721', '505405355', 'Wejcherowo', 'Wichrowa', 'Piotr', 'Mierwa'),
          (10,'98755532163', '377799932', 'Puck', 'Polna', 'Cyprian', 'Lalka');
--dodawanie niepoprane do Mechanicy

INSERT INTO Mechanicy (Id_pracownika, Pesel, Numer_telefonu, Miasto, Ulica, Imie, Nazwisko)
    VALUES(11,'09321678302', '679321788', '9opot', 'Topolowa', 'Teofil', 'Krema'); --niepoprawny adres , pozostałe ograniczenia zostały sprawdzane w tworzeniu wczesniejszych tabel


--dodawanie poprawne do Rejestr

INSERT INTO Rejestr_przyjec_i_odbiorow (Godzina_przyjecia, Godzina_odbioru, Czy_umowiony, Numer_zlecenia, Data_przyjecia, Data_odbioru, Data_planowanego_odbioru, Godzina_planowanego_odbioru, Id_klienta, Id_samochodu)
 VALUES ('08:30:00', '12:00:00',1, '0000001', '2023-12-09', '2023-12-10', '2023-12-10', '12:00:00','100000001', '1GNEK13Z22J231291'),
        ('07:00:00', NULL      ,1, '0000002', '2023-12-09', NULL        , NULL        , NULL      ,'100000002', 'JH4DB1660SS006112'),
        
        ('07:45:00', '16:45:00',0, '0000003', '2023-12-10', '2023-12-10', '2023-12-10', '17:00:00','100000003', 'WBAAV53491FJ91522'),
        ('11:10:00', '12:15:00',1, '0000004', '2023-12-10', '2023-12-11', '2023-12-11', '12:00:00','100000004', '3VW507AT5FM808950'),
        ('19:30:00', '08:00:00',0, '0000005', '2023-12-10', '2023-12-11', '2023-12-11', '08:00:00','100000005', 'KMHJF35F3WU152863'),
        
        ('08:30:00', '08:00:00',1, '0000006', '2023-12-11', '2023-12-12', '2023-12-12', '08:00:00','100000001', '1GNEK13Z22J231291'),
        ('08:30:00', NULL      ,1, '0000007', '2023-12-11', NULL        , NULL        , NULL      ,'100000007', '1N4AL11D96C210056'),
        ('09:30:00', '09:00:00',1, '0000008', '2023-12-11', '2023-12-12', '2023-12-12', '09:00:00','100000008', '5NPEB4AC1DH803722'),
        
        ('08:00:00', '09:00:00',1, '0000009', '2023-12-12', '2023-12-13', '2023-12-13', '09:00:00','100000001', '2G1WF52K449313177'),
        ('08:30:00', '09:00:00',1, '0000010', '2023-12-12', '2023-12-13', '2023-12-13', '12:45:00','100000010', '5FNYF3H56FB002040'),
        ('15:30:00', NULL      ,0, '0000011', '2023-12-12', NULL        , NULL        , NULL      ,'100000011', '1NXBR32E87Z851542'),
        ('09:30:00', '09:00:00',1, '0000012', '2023-12-12', '2023-12-13', '2023-12-13', '15:30:00','100000012', 'JM1BK32F191227305'),

        ('07:30:00', '12:45:00',1, '0000013', '2023-12-13', '2023-12-13', '2023-12-13', '12:45:00','100000013', '1HGCM82633A033131'),
        ('09:30:00', NULL      ,0, '0000014', '2023-12-13', NULL        , NULL        , NULL      ,'100000014', 'WBAEW534X4PN35374'),
        ('10:00:00', '09:00:00',1, '0000015', '2023-12-13', '2023-12-14', '2023-12-14', '09:45:00','100000015', '1FTZR15E25PA76371'),
        ('10:30:00', '17:00:00',0, '0000016', '2023-12-13', '2023-12-14', '2023-12-14', '17:00:00','100000016', '5N1AR18W89C601636'),

        ('08:30:00', '16:00:00',1, '0000017', '2023-12-14', '2023-12-16', '2023-12-16', '16:00:00','100000017', '4T1BE32K13U730150'),
        ('15:30:00', NULL      ,1, '0000018', '2023-12-14', NULL        , NULL        , NULL      ,'100000018', 'JHMCG56442C013610'),
        ('08:30:00', '09:00:00',1, '0000019', '2023-12-14', '2023-12-14', '2023-12-14', '09:00:00','100000019', '3N1AB6AP8AL675826'),
        ('15:30:00', NULL      ,1, '0000020', '2023-12-14', NULL        , NULL        , NULL      ,'100000020', '1GNFK13058R215926');

--dodanie niepoprawnych danych do rejestru przyjec i odbiorow

INSERT INTO Rejestr_przyjec_i_odbiorow (Godzina_przyjecia, Godzina_odbioru, Czy_umowiony, Numer_zlecenia, Data_przyjecia, Data_odbioru, Data_planowanego_odbioru, Godzina_planowanego_odbioru, Id_klienta, Id_samochodu)
 VALUES ('08:30:00', '12:00:00',1, '00000021', '2023-12-09', '2023-12-10', '2023-12-10', '12:00:00','100000021', '1GNEK13Z22J3212910'); --sprawdzenie czy sie zgadza


--dodawanie poprawnych do Urlopow

INSERT INTO Urlopy(Id, Rodzaj, Data_rozpoczecia, Data_zakonczenia, Id_pracownika)
    VALUES (1, 'Urlop wypoczynkowy', '2024-06-17', '2024-06-21', 1),
           (2, 'Urlop zdrowotny', '2023-12-15', '2023-12-15', 2),
           (3, 'Urlop macierzyński/urlop rodzicielski', '2024-02-04', '2024-06-21',3),
           (4, 'Urlop szkoleniowy', '2023-12-18', '2023-12-22',4),
           (5, 'Urlop natychmiastowy', '2023-12-13', '2023-12-15',1),
           (6, 'Urlop bezpłatny', '2023-12-13', '2023-12-28',6),
           (7, 'Urlop wypoczynkowy', '2024-01-14', '2024-01-28',7),
           (8, 'Urlop wypoczynkowy', '2024-01-15', '2024-01-21',8),
           (9, 'Urlop szkoleniowy', '2024-02-13', '2024-02-15',9),
           (10, 'Urlop natychmiastowy', '2023-12-26', '2023-12-28',10);

--dodawanie niepoprawnych danycyh do Urlopow

INSERT INTO Urlopy(Id, Rodzaj, Data_rozpoczecia, Data_zakonczenia, Id_pracownika)
    VALUES (11, 'Urlop wypoczynk', '2024-06-19', '2024-06-23', 1); --nieporawny rodzaj urlopu


--dodawanie poprawnych danych do Zmian

INSERT INTO Zmiany (Id_zmiany, Godzina_rozpoczecia, Godzina_zakonczenia, Data_rozpoczecia, Data_zakonczenia, Id_pracownika) 
    VALUES (1,'07:00:00', '17:00:00', '2023-12-09', '2023-12-09',1),
           (2,'07:00:00', '12:00:00', '2023-12-09', '2023-12-09',2),
           
           (3,'07:00:00', '17:00:00', '2023-12-10', '2023-12-10',3),
           (4,'11:00:00', '18:00:00', '2023-12-10', '2023-12-10',4),
           (5,'13:00:00', '20:00:00', '2023-12-10', '2023-12-10',5),
           
           (6,'07:00:00', '12:00:00', '2023-12-11', '2023-12-11',6),
           (7,'07:00:00', '13:00:00', '2023-12-11', '2023-12-11',7),
           (8,'07:00:00', '14:00:00', '2023-12-11', '2023-12-11',8),
           
           (9,'07:00:00', '15:00:00', '2023-12-12', '2023-12-12',9),
           (10,'09:00:00', '16:00:00', '2023-12-12', '2023-12-12',10),
           (11,'10:00:00', '17:00:00', '2023-12-12', '2023-12-12',1),
           (12,'10:00:00', '17:00:00', '2023-12-12', '2023-12-12',2),
           
           (13,'08:00:00', '15:00:00', '2023-12-13', '2023-12-13',3),
           (14,'08:00:00', '15:00:00', '2023-12-13', '2023-12-13',4),
           (15,'12:00:00', '19:00:00', '2023-12-13', '2023-12-13',7),
           (16,'12:00:00', '19:00:00', '2023-12-13', '2023-12-13',6),
           
           (17,'08:00:00', '15:00:00', '2023-12-14', '2023-12-14',8),
           (18,'08:00:00', '15:00:00', '2023-12-14', '2023-12-14',9),
           (19,'10:00:00', '17:00:00', '2023-12-14', '2023-12-14',10),
           (20,'10:00:00', '17:00:00', '2023-12-14', '2023-12-14',1);

--dodawanie niepoprawnych do Zmian

INSERT INTO Zmiany (Id_zmiany, Godzina_rozpoczecia, Godzina_zakonczenia, Data_rozpoczecia, Data_zakonczenia, Id_pracownika) 
    VALUES (10000000,'07:00:00', '17:00:00', '2023-12-09', '2023-12-09',1);--niepoprawny numer zmiany


--dodawanie poprawnych Naprawy

INSERT INTO Naprawy (Id_naprawy, Stanowisko, Uwagi, Data_rozpoczecia, Data_zakonczenia, Id_samochodu, Id_pracownika)
    VALUES (1,1,'Wymiana klocków hamulcowych, sprawdzenie opon i wymiana kompletu na zimowe', '2023-12-09', '2023-12-09','1GNEK13Z22J231291',1),
           (2,2,'Totalna awaria silnika: Woda w zbiorniczku wyrównawczym, silnik do wymiany, czekamy na dostawy', '2023-12-09', NULL,'JH4DB1660SS006112',2),
           
           (3,1,'Ostukany od dołu, rdza na nadkolach, zepsute amortyzatory do wymiany', '2023-12-10', '2023-12-10','WBAAV53491FJ91522',3),
           (4,3,'Gołe opony do wymiany', '2023-12-10', '2023-12-11','3VW507AT5FM808950',4),
           (5,4,'Potrzebny serwis olejowy, brak oleju na magazynie: dolać z rana', '2023-12-10', '2023-12-11','KMHJF35F3WU152863',5),
           
           (6,1,'Tarcze hamulcowe oraz klocki do wymiany, trzeba zamówić', '2023-12-11', '2023-12-12','1GNEK13Z22J231291',6),
           (7,5,'Zatarta skrzynia biegów, trzeba zamówić', '2023-12-11', NULL,'1N4AL11D96C210056',7),
           (8,6,'Wycieki z silnika, wymienić wszystkie filtry, głównie filtr paliwa', '2023-12-11', '2023-12-12','5NPEB4AC1DH803722',8),
           
           (9,1,'Wymagane wywazenie opon', '2023-12-12', '2023-12-13','2G1WF52K449313177',9),
           (10,3,'Przednie amortyzatory do wymiany', '2023-12-12', '2023-12-13','5FNYF3H56FB002040',10),
           (11,7,'Wymagana modernizacja silnika', '2023-12-12', NULL,'1NXBR32E87Z851542',1),
           (12,6,'Potrzebna wymiana przedniej zarówki oraz niesprawny pasek klinowy', '2023-12-12', '2023-12-13','JM1BK32F191227305',2),
           
           (13,1,'Potrzebna wymiana opon', '2023-12-13', '2023-12-13','1HGCM82633A033131',3),
           (14,4,'Rozbita mała szybka od strony kierowcy, wyciek z silnika', '2023-12-13', NULL,'WBAEW534X4PN35374',4),
           (15,6,'Klocki i tarcze do wymiany, lampka tablicy rejestracyjnej nie działa', '2023-12-13', '2023-12-14','1FTZR15E25PA76371',7),
           (16,3,'Potrzebna diagnostka bezpiecznikowa, nie działa silniczek szyby kierowcy', '2023-12-13', '2023-12-14','5N1AR18W89C601636',6),
           
           (17,1,'Potrzebna jest wymiana klocków', '2023-12-14', '2023-12-16','4T1BE32K13U730150',8),
           (18,3,'Wady w elektronice, potrzebna diagnostyka elektryka', '2023-12-14', NULL,'JHMCG56442C013610',9),
           (19,6,'Wymagana kompleksowa diagnostyka wahaczy', '2023-12-14', '2023-12-14','3N1AB6AP8AL675826',10),
           (20,8,'Potrzebny nowy silnik na zyczenie klienta: 1.2 HDI', '2023-12-14', NULL,'1GNFK13058R215926',1);


--dodanie niepoprawnych danych do Napraw

INSERT INTO Naprawy (Id_naprawy, Stanowisko, Uwagi, Data_rozpoczecia, Data_zakonczenia, Id_samochodu, Id_pracownika)
    VALUES (21,21,'Wymiana klocków hamulcowych, sprawdzenie opon i wymiana kompletu na zimowe', '2023-12-09', '2023-12-09','1GNEK13Z22J231291',1); --blad w nazwie w uwagach

--dodawanie poprawnych wartosci do DOstawcow czesci

INSERT INTO Dostawcy_czesci(Numer_zlecenia, Nazwa, Specjalizacja, Termin_dostaw)
    VALUES  (1,'NIRco Nitro', 'Układ wydechowy','2023-12-08'),
            (2,'Vredestein', 'Układ hamulcowy','2023-12-08'),
            (3,'Windflow', 'Filtry','2023-12-08'),
            (4,'Goodlock', 'Rozrząd','2023-12-08'),
            (5,'Spitfire', 'Oświetlenie','2023-12-08'),
            (6,'Hydrobuild', 'Układ zawieszenia','2023-12-08'),
            (7,'COOLpack', 'Chłodzenie','2023-12-08'),
            (8,'LITO Wires', 'Układ elektryczny','2023-12-08'),
            (9,'Hancook Tires', 'Opony','2023-12-08'),
            (10,'BOSCH', 'Układ napędowy','2023-12-08');

--dodanie niepoprawnej danej do Dostawcy_czesci
           
INSERT INTO Dostawcy_czesci(Numer_zlecenia, Nazwa, Specjalizacja, Termin_dostaw)
    VALUES  (11,'NIRco Nitro', 'Układ kreskowy','2023-12-09'); -- niepoprawna nazwa specjalizacji 
                      
--dodawanie poprawnych danych do Części samochodowe

INSERT INTO Czesci_samochodowe(Numer_seryjny, Nazwa, Rok_produkcji, Id_czesci)
    VALUES ('3K5r8x7M1P', 'Wydech Akrapovich', 2023,1),      
           ('a4W9pD6Rt5', 'Katalizator', 2023,1),
           ('Y2n7jF1b4L', 'Klocki Hamulcowe R43 10 kompletów', 2023,2),
           ('s8H6A3zV9Y', 'Tarcze Hamulcowe Pure Sport', 2022,2),
           ('Q5m6oE1n7F', 'Filtr Oleju VG x 10', 2023,3),
           ('4c9sR6xN2W', 'Filtr Kabinowy Fresh', 2023,3),
           ('gT1v5jY3r2', 'Głowica Wielofunkcyjna', 2021,4),
           ('7B5k9iZ2vM', 'Pasek zacisku medium', 2022,4),
           ('d6J8S2p4F7', 'Uszczelki 66mm', 2023,4),
           ('L3t9iQ7fZ4', 'Świetlówki OSRAM 6V', 2023,5),
           ('P2s6mV8o1A', 'Coilovers 3cm', 2023,6),
           ('x5Q4N6a9K', 'Śruby hydrauliczne 88', 2021,6),
           ('Z7f2V4T6e', 'Intercooler Martus', 2021,7),
           ('1H8w5I3b7M', 'Kabel przewodu zasilania', 2023,8),
           ('c9S4eK7i3G', 'Zasilanie immobilizera mid', 2023,8),
           ('R2t6fP4y9N', 'Komplet bezpieczników 2,5A-25A', 2022,8),
           ('5M9g1B8z6L', 'Hancook Drift Komplet 35/30/19', 2022,9),
           ('W3u7C2j5A1', 'Michelin Smooth 45/40/21 x10', 2020,9),
           ('e6D2a4G9xN', 'Przedni dyferencjał Vag', 2019,10),
           ('H1q3n7J5pK', 'Przekładnia przednia S', 2021,10);

--dodawanie niepoprawnych do Czesci_samochodowe

INSERT INTO Czesci_samochodowe(Numer_seryjny, Nazwa, Rok_produkcji, Id_czesci)
    VALUES ('3K5r8x7M1Phdsai2dsa67521331321ndsai223HHD', 'Wydech Akrapovich', 2023,1); --za dlugi numerseryjny

--dodawanie poprawnych wartosci do Ilosc_zuzytych_zcesci    

INSERT INTO Ilosc_zuzytych_czesci(Numer_faktury_serwisowej, Uwagi, Stan_czesci, Ilosc, Id_czesci, Id_naprawy)
    VALUES (1,'Wymieniono klocki oraz tarcze hamulcowe, sprawdzono kola', 'Nowe', 8,'Y2n7jF1b4L', 1),
    (2,'Wymieniono amortyzatory, dodano nowy wydech', 'Nowe', 2,'3K5r8x7M1P', 3),
    (3,'Wstawiono glowice, czekamy na silnik', 'Nowe', 1,'gT1v5jY3r2', 2),
    (4,'Zalozono nowe opony', 'Nowe', 4,'W3u7C2j5A1', 4),
    (5,'Wymieniono filtr oleju, dolano nowy', 'Nowe', 1,'Q5m6oE1n7F', 5),
    (6,'Wymieniono klocki oraz tarcze hamulcowe, sprawdzono kola', 'Nowe', 8,'Y2n7jF1b4L', 6),
    (7,'Przepwowadzono wymiane dyferencjału, czekamy na skrzynie biegów', 'Nowe', 1,'e6D2a4G9xN', 7),
    (8,'Przeprowadzono serwis filtrów oraz olejowy', 'Nowe', 4,'Q5m6oE1n7F', 8),
    (9,'Wywazono opony, uzyto starych opon klienta oraz wstawiono nowe', 'Uzywane', 8,'5M9g1B8z6L', 9),
    (10,'Wstawiono nowe amortyzatory oraz śruby','Nowe',8,'P2s6mV8o1A',10),
    (11,'Czekamy na silnik, wymieniona przekladnia','Nowe',1,'H1q3n7J5pK',11),
    (13,'Wymienione opony na nowy komplet','Nowe',4,'W3u7C2j5A1',13),
    (12,'Wymieniona zarówka','Nowe',1,'L3t9iQ7fZ4',12),
    (14,'Wymieniono szybkę oraz wstawiono uszczelki','Nowe',3,'d6J8S2p4F7',14),
    (15,'Wymieniono klocki oraz tarcze hamulcowe, sprawdzono kola, wymieniono zarówke','Nowe',8,'Y2n7jF1b4L',15),
    (16,'Naprawiono skrzynke z bezpiecznikami','Nowe',12,'R2t6fP4y9N',16),
    (17,'Wynieniono klocki hamulcowe','Nowe',4,'Y2n7jF1b4L',17),
    (18,'Wymieniono przewody, czekamy na elektryka','Nowe',1,'1H8w5I3b7M',18),
    (19,'Naprawiono problem z wahaczem','Nowe',5,'7B5k9iZ2vM',19),
    (20,'Czekamy na silnik, dodano intercooler: wymaga tego zmiana silnika','Nowe',1,'Z7f2V4T6e',20);


--dodanie poprawnych danych do Przeglady

INSERT INTO Przeglady(Numer_przegladu, Data_przegladu, Uwagi, Wynik, Id_samochodu)
    VALUES(1,'2019-10-09','Wszystko poprawne', 1,'1GNEK13Z22J231291'),
            (2,'2020-10-07','Nastepnym razem wymienic opony', 1,'1GNEK13Z22J231291'),
            (3,'2021-10-04','Mocno zuzyte klocki hamulcowe ale wymieniono', 0,'1GNEK13Z22J231291'),
            (4,'2019-06-03','Wszystko poprawne', 1,'JH4DB1660SS006112'),
            (5,'2020-06-02','Wszystko poprawne', 1,'JH4DB1660SS006112'),
            (6,'2023-05-30','Wszystko poprawne', 1,'JH4DB1660SS006112'),
            (7,'2022-03-30','Wycieki z silnika', 0,'1NXBR32E87Z851542'),
            (8,'2021-03-31','Wszystko poprawne', 1,'1NXBR32E87Z851542'),
            (9,'2021-03-24','Brak lampki tablicy rejestracyjnej', 0,'1NXBR32E87Z851542'),
            (10,'2021-03-25','Wszystko popsute', 0,'1NXBR32E87Z851542'),
            (11,'2012-07-25','Nastepnym razem wymienic amortyzatory', 1,'5N1AR18W89C601636'),
            (12,'2013-07-23','Wszystko poprawne', 1,'5N1AR18W89C601636'),
            (13,'2014-07-19','Szykuje sie wymiana opon', 1,'5N1AR18W89C601636'),
            (14,'2015-07-18','Wszystko poprawne', 1,'5N1AR18W89C601636'),
            (15,'2016-07-18','Lekkie wgniecenie szyby tylniej prawej', 0,'5N1AR18W89C601636'),
            (16,'2017-07-17','Wszystko poprawne', 1,'5N1AR18W89C601636'),
            (17,'2018-07-18','Wszystko poprawne', 1,'5N1AR18W89C601636'),
            (18,'2020-09-05','Wszystko poprawne', 1,'1N4AL11D96C210056'),
            (19,'2021-09-05','Rozbita przednia szyba', 0,'1N4AL11D96C210056'),
            (20,'2022-09-04','Wszystko poprawne', 1,'1N4AL11D96C210056');
            
--SELECT * FROM Klienci