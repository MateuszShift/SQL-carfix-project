--W warsztacie często występują sytuacje w których trzeba szybko wezwac mechanika aby przeprowadzil naprawe. Właściciel chce sprawdzić liu pracowników ma rozpisany urlop w przeciągu najbliszych dni aby pozniej wiedziec kogo nie brac pod uwage przy planowaniu grafiku. 
--Ilu pracowników w najblizszym czasie (np 2 tygodnie) ma rozpisany urlop?
SELECT Mechanicy.Id_pracownika, Mechanicy.Imie, Mechanicy.Nazwisko, Urlopy.Data_rozpoczecia, Urlopy.Data_zakonczenia
FROM Mechanicy
JOIN Urlopy ON Mechanicy.Id_pracownika = Urlopy.Id_pracownika
WHERE Urlopy.Data_rozpoczecia BETWEEN GETDATE() AND DATEADD(WEEK, 2, GETDATE())
   OR Urlopy.Data_zakonczenia BETWEEN GETDATE() AND DATEADD(WEEK, 2, GETDATE())


--Czasami naprawiane samochody wymagają sprowadzenia bardzo specjalistycznej części co czasami długo trwa. Kierownik zmiany chce dowiedziec sie ktore padoki naprawcze sa zajete na dluzej przez przeciagajace sie naprawy aby wiedziec ktore naprawy powinny byc priorytetowe.
--Które padoki są zajęte przez przedluzajace sie naprawy?
SELECT Naprawy.Stanowisko, Naprawy.Data_rozpoczecia, Samochody.VIN
FROM Naprawy
JOIN Samochody ON Naprawy.Id_samochodu = Samochody.VIN
WHERE Naprawy.Data_zakonczenia IS NULL
ORDER BY Naprawy.Data_rozpoczecia ASC

--Czesto zdarza sie ze podczas przedluzajacej sie naprawy mechanik musi zostac dluzej albo przyjsc na dodatkowa zmiane w celu jej przeprowadzenia. Wlasciciel chce sprawdzic ktory z pracownikow jest najbardziej zaangazowany w prace w warsztacie. Pod koniec roku przydziela premie za kazda zmiane w roku dostaje 5 zl.
--Ile bonusu dostanie kazdy z pracownikow za przepracowane zmiany?
SELECT Mechanicy.Imie, Mechanicy.Nazwisko, Zmiany.Id_pracownika, COUNT(*) * 5 AS Bonus
FROM Zmiany
JOIN Mechanicy ON Zmiany.Id_pracownika = Mechanicy.Id_pracownika
GROUP BY Zmiany.Id_pracownika, Mechanicy.Imie, Mechanicy.Nazwisko;


--Co roku wlasciciel w celu zachecenia do przyprowadzania samochodu wlasnie do jego warsztatu organizuje promocje dla najczesciej przyjezdzajacych klientow.
--Ile procent znizki na kolejna wizyte otrzymaja klienci ktorzy byli juz w warsztacie? (stali klienci)

WITH LiczbaWizyt AS (
    SELECT Id_klienta, COUNT(*) AS IloscWizyt
    FROM Rejestr_przyjec_i_odbiorow
    GROUP BY Id_klienta
)
SELECT Klienci.Id_klienta, Klienci.Imie, Klienci.Nazwisko, LiczbaWizyt.IloscWizyt,
       CASE 
            WHEN LiczbaWizyt.IloscWizyt = 1 THEN 'Brak znizki'
           WHEN LiczbaWizyt.IloscWizyt = 2 THEN '5%'
           WHEN LiczbaWizyt.IloscWizyt = 3 THEN '10%'
           ELSE '15%'
       END AS Znizka
FROM Klienci 
JOIN LiczbaWizyt ON Klienci.Id_klienta = LiczbaWizyt.Id_klienta
ORDER BY LiczbaWizyt.Id_klienta ASC;

--Scenariusz
--Zdenerwowany klient dzwoni do warsztatu, bo jego samochód zepsuł się pięć dni po odebrania z warsztatu i rząda wyjaśnień, co poszło nie tak. Szef musi --skontaktować się z mechanikiem, który przeprowadza naprawę tego smaochodu.
--2. Zapytanie
--Znaleźć numer telefonu mechanika, który naprawiał samochód o podanym numerze VIN (np W VGZZZ5N Z 8 W 031284) I samochód ten został odebrany w określonym dniu --(w scenariuszu ‘pięć dni temu’, np 30.12.2023). Napisz do tego SELECT

SELECT
    Rejestr_przyjec_i_odbiorow.Id_klienta,
    Mechanicy.Imie AS Imie_mechanika,
    Mechanicy.Nazwisko AS Nazwisko_mechanika,
    Samochody.VIN,
    Mechanicy.Numer_telefonu AS Numer_telefonu_mechanika,
    Rejestr_przyjec_i_odbiorow.Data_odbioru
FROM
    Rejestr_przyjec_i_odbiorow
JOIN
    Samochody ON Rejestr_przyjec_i_odbiorow.Id_samochodu = Samochody.VIN
JOIN
    Naprawy ON Samochody.VIN = Naprawy.Id_samochodu
JOIN
    Mechanicy ON Naprawy.Id_pracownika = Mechanicy.Id_pracownika
JOIN
    Klienci ON Rejestr_przyjec_i_odbiorow.Id_klienta = Klienci.Id_klienta
WHERE
    Samochody.VIN = '3VW507AT5FM808950' 
    AND Rejestr_przyjec_i_odbiorow.Data_odbioru = '2023-12-11';


--Scenariusz
--Urząd kontroli przykłada wielką wagę do bezpieczeństwa na drogach i kaze dodatkowo kontrolować wszytkie przeglądy które zakończylu sie wynikiem negatywnym
--Uporządkuj ile dany samochód przechodził przegląd w naszym warsztacie i wyświetl te samochody na które trzeba zwrócić szczególną uwagę, czyli te które nie przeszły w danym roku przeglądu za pierwszym razem


WITH PrzegladInfo AS (
    SELECT
        Przeglady.Id_samochodu,
        YEAR(Przeglady.Data_przegladu) AS RokPrzegladu,
        COUNT(*) AS LiczbaPrzegladow,
        MAX(Przeglady.Data_przegladu) AS OstatniPrzeglad
    FROM
        Przeglady
    GROUP BY
        Przeglady.Id_samochodu, YEAR(Przeglady.Data_przegladu)
)

SELECT
    Samochody.VIN,
    Samochody.Marka,
    Samochody.Model,
    PrzegladInfo.RokPrzegladu,
    PrzegladInfo.LiczbaPrzegladow,
    PrzegladInfo.OstatniPrzeglad AS DataOstatniegoPrzegladu,
    CASE WHEN PrzegladInfo.LiczbaPrzegladow > 1 AND NOT EXISTS (
        SELECT 1
        FROM Przeglady 
        WHERE Przeglady.Id_samochodu = PrzegladInfo.Id_samochodu
          AND Przeglady.Wynik = 0
    ) OR EXISTS (
        SELECT 1
        FROM Przeglady 
        WHERE Przeglady.Id_samochodu = PrzegladInfo.Id_samochodu
          AND YEAR(Przeglady.Data_przegladu)-1 = PrzegladInfo.RokPrzegladu - 1
          AND Przeglady.Wynik = 0
    ) THEN 'Wymaga uwagi!'
    ELSE 'Brak uwag'
    END AS Uwagi
FROM
    Samochody 
JOIN 
    PrzegladInfo ON Samochody.VIN = PrzegladInfo.Id_samochodu
ORDER BY
    Samochody.VIN, PrzegladInfo.RokPrzegladu;



--Kierownik zmian chcąc rozpisać grafik zwraca uwagę na to kto w danym okresie miał najmniej zmian. 
--Pokaz z których pracownikow kierownik moze sobie wybrac przygotowujac grafik na najblizsze dni


GO
CREATE VIEW ZmianyMechanikow AS
SELECT
    Mechanicy.Id_pracownika,
    Mechanicy.Imie,
    Mechanicy.Nazwisko,
    COUNT(Zmiany.Id_zmiany) AS LiczbaZmian,
    MAX(Zmiany.Data_zakonczenia) AS DataOstatniejZmiany
FROM
    Mechanicy 
JOIN
    Zmiany ON Mechanicy.Id_pracownika = Zmiany.Id_pracownika
GROUP BY
    Mechanicy.Id_pracownika, Mechanicy.Imie, Mechanicy.Nazwisko;
GO
SELECT
    ZmianyMechanikow.Id_pracownika,
    ZmianyMechanikow.Imie,
    ZmianyMechanikow.Nazwisko,
    ZmianyMechanikow.LiczbaZmian,
    ZmianyMechanikow.DataOstatniejZmiany
FROM
    ZmianyMechanikow 
ORDER BY
    ZmianyMechanikow.LiczbaZmian ASC;






--Wlasciciel chce ustalic budzet ktory bedzie przeznaczony na czesci samochodowe w nastepnym roku patrzac na zamowienia tegoroczne aby wsyztko bylo w magazynie i nie trzeba bylo
--tak dlugo czekac na najpotrzebniejsze czesci

--Sprawdz ile zostało zamowionych poszczegolnych rodzajow czesci i okresl ile pieniedzy przeznaczyc na czesci w kolejnym roku jako suma wszystkich wydatkow tegorocznych

SELECT
    SUM(Kwota) AS SumaWartosciZamowionychCzesci
FROM
    (
        SELECT
            Dostawcy_czesci.Specjalizacja,
            SUM(
                CASE
                    WHEN Dostawcy_czesci.Specjalizacja = 'Układ hamulcowy' THEN 10000
                    WHEN Dostawcy_czesci.Specjalizacja = 'Filtry' THEN 5000
                    WHEN Dostawcy_czesci.Specjalizacja = 'Rozrząd' THEN 5000
                    WHEN Dostawcy_czesci.Specjalizacja = 'Układ napędowy' THEN 54000
                    WHEN Dostawcy_czesci.Specjalizacja = 'Oświetlenie' THEN 11430
                    WHEN Dostawcy_czesci.Specjalizacja = 'Układ zawieszenia' THEN 32500
                    WHEN Dostawcy_czesci.Specjalizacja = 'Chłodzenie' THEN 12000
                    WHEN Dostawcy_czesci.Specjalizacja = 'Układ elektryczny' THEN 7000
                    WHEN Dostawcy_czesci.Specjalizacja = 'Opony' THEN 6000
                    WHEN Dostawcy_czesci.Specjalizacja = 'Układ wydechowy' THEN 9000
                    ELSE 0
                END
            ) AS Kwota
        FROM
            Dostawcy_czesci
        GROUP BY
            Dostawcy_czesci.Specjalizacja
    ) AS Podzapytanie;

