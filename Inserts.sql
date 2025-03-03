-- inserarea valorilor in tabela Tari

INSERT INTO Tari (id_tara, nume) VALUES (1, 'Statele Unite');
INSERT INTO Tari (id_tara, nume) VALUES (2, 'Franta');
INSERT INTO Tari (id_tara, nume) VALUES (3, 'Italia');
INSERT INTO Tari (id_tara, nume) VALUES (4, 'Germania');
INSERT INTO Tari (id_tara, nume) VALUES (5, 'Marea Britanie');
INSERT INTO Tari (id_tara, nume) VALUES (6, 'Spania');
INSERT INTO Tari (id_tara, nume) VALUES (7, 'Suedia');
INSERT INTO Tari (id_tara, nume) VALUES (8, 'Canada');
INSERT INTO Tari (id_tara, nume) VALUES (9, 'Polonia');
INSERT INTO Tari (id_tara, nume) VALUES (10, 'Japonia');
INSERT INTO Tari (id_tara, nume) VALUES (11, 'Romania');

select * from Tari;

---------------------------------------------------------------

-- inserarea valorilor din tabela Regizori

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (1, 1, 'Spielberg', 'Steven', TO_DATE('1946-12-18', 'YYYY-MM-DD'));
INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (2, 1, 'Tarantino', 'Quentin', TO_DATE('1963-03-27', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (3, 2, 'Truffaut', 'François', TO_DATE('1932-02-06', 'YYYY-MM-DD'));
INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (4, 2, 'Godard', 'Jean-Luc', TO_DATE('1930-12-03', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (5, 3, 'Fellini', 'Federico', TO_DATE('1920-01-20', 'YYYY-MM-DD'));
INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (6, 3, 'Antonioni', 'Michelangelo', TO_DATE('1912-09-29', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (7, 4, 'Herzog', 'Werner', TO_DATE('1942-09-05', 'YYYY-MM-DD'));
INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (8, 4, 'Fassbinder', 'Rainer Werner', TO_DATE('1945-05-31', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (9, 5, 'Nolan', 'Christopher', TO_DATE('1970-07-30', 'YYYY-MM-DD'));
INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (10, 5, 'Hitchcock', 'Alfred', TO_DATE('1899-08-13', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (11, 6, 'Almodovar', 'Pedro', TO_DATE('1949-09-24', 'YYYY-MM-DD'));
INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (12, 6, 'Bunuel', 'Luis', TO_DATE('1900-02-22', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (13, 7, 'Bergman', 'Ingmar', TO_DATE('1918-07-14', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (14, 8, 'Cronenberg', 'David', TO_DATE('1943-03-15', 'YYYY-MM-DD'));
INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (15, 8, 'Villeneuve', 'Denis', TO_DATE('1967-10-03', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (16, 9, 'Polanski', 'Roman', TO_DATE('1933-08-18', 'YYYY-MM-DD'));
INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (17, 9, 'Wajda', 'Andrzej', TO_DATE('1926-04-06', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (18, 10, 'Kurosawa', 'Akira', TO_DATE('1910-03-23', 'YYYY-MM-DD'));
INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (19, 10, 'Miyazaki', 'Hayao', TO_DATE('1941-01-05', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (20, 11, 'Mungiu', 'Cristian', TO_DATE('1968-04-27', 'YYYY-MM-DD'));
INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii) VALUES (21, 11, 'Puiu', 'Cristi', TO_DATE('1967-04-03', 'YYYY-MM-DD'));

Select * from Regizori;

---------------------------------------------------------------

-- inserarea valorilor din tabela Filme

-- Filme din Statele Unite (Steven Spielberg)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (1, 1, 'Schindler`s List', TO_DATE('1993-12-15', 'YYYY-MM-DD'), 195, 'Engleza', 'O drama istorica despre Oskar Schindler, un om de afaceri german care a salvat vietile a peste o mie de evrei in timpul Holocaustului.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (2, 1, 'Jurassic Park', TO_DATE('1993-06-11', 'YYYY-MM-DD'), 127, 'Engleza', 'Un parc tematic cu dinozauri clonati devine un loc periculos cand animalele scapa de sub control.');

-- Filme din Statele Unite (Quentin Tarantino)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (3, 2, 'Pulp Fiction', TO_DATE('1994-09-23', 'YYYY-MM-DD'), 154, 'Engleza', 'Un film care urmareste povestile intersectate ale unor personaje din lumea interlopa din Los Angeles.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (4, 2, 'Kill Bill: Vol. 1', TO_DATE('2003-10-10', 'YYYY-MM-DD'), 111, 'Engleza', 'O femeie razbunatoare porneste într-o misiune de a razbuna tradarile din trecutul ei.');

-- Filme din Franta (François Truffaut)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (5, 3, 'The 400 Blows', TO_DATE('1959-04-19', 'YYYY-MM-DD'), 99, 'Franceza', 'Un film despre un baiat rebel care este abandonat de parinti si isi petrece timpul pe strazi.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (6, 3, 'Fahrenheit 451', TO_DATE('1966-09-11', 'YYYY-MM-DD'), 112, 'Engleza', 'O distopie în care cartile sunt interzise, iar oamenii care le citesc sunt urmariti.');

-- Filme din Franta (Jean-Luc Godard)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (7, 4, 'Breathless', TO_DATE('1960-03-16', 'YYYY-MM-DD'), 90, 'Franceza', 'Un film despre un tanar criminal din Paris care este urmarit de politie ?i o tanara jurnalista.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (8, 4, 'Alphaville', TO_DATE('1965-02-03', 'YYYY-MM-DD'), 99, 'Franceza', 'Un agent secret ajunge intr-un oras futurist controlat de o super-inteligenta numita Alpha.');

-- Filme din Italia (Federico Fellini)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (9, 5, '8½', TO_DATE('1963-02-14', 'YYYY-MM-DD'), 138, 'Italiana', 'Un regizor de film în criza de inspiratie incearca sa regaseasca sensul vietii sale in mijlocul unui haos creativ.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (10, 5, 'La Dolce Vita', TO_DATE('1960-02-05', 'YYYY-MM-DD'), 174, 'Italiana', 'Un jurnalist italian traieste o viata plina de petreceri si distractie in Roma, in timp ce cauta sensul adevarat al vietii.');

-- Filme din Italia (Michelangelo Antonioni)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (11, 6, 'Blow-Up', TO_DATE('1966-12-01', 'YYYY-MM-DD'), 111, 'Engleza', 'Un fotograf londonez capteaza accidental o scena care pare a fi o crima, dar nu poate fi sigur.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (12, 6, 'Red Desert', TO_DATE('1964-11-07', 'YYYY-MM-DD'), 120, 'Italiana', 'O femeie se lupta cu o depresie profunda in mijlocul unui peisaj industrial din Italia.');

-- Filme din Germania (Werner Herzog)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (13, 7, 'Aguirre, the Wrath of God', TO_DATE('1972-05-06', 'YYYY-MM-DD'), 93, 'Germana', 'Un expeditianar spaniol rataceste in jungla amazoniana in cautarea unui oras legendar aurit.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (14, 7, 'Fitzcarraldo', TO_DATE('1982-03-19', 'YYYY-MM-DD'), 158, 'Engleza', 'Un om incearca sa aduca opera de opera intr-un oras izolat din jungla amazoniana, cu pretul sacrificiilor extreme.');

-- Filme din Germania (Rainer Werner Fassbinder)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (15, 8, 'Ali: Fear Eats the Soul', TO_DATE('1974-09-05', 'YYYY-MM-DD'), 93, 'Germana', 'O poveste despre iubirea dintre o femeie mai in varsta si un barbat tanar dintr-o alta cultura.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (16, 8, 'The Marriage of Maria Braun', TO_DATE('1979-03-22', 'YYYY-MM-DD'), 120, 'Germana', 'O femeie incearca sa-si construiasca viata dupa al Doilea Razboi Mondial in Germania.');

-- Filme din Marea Britanie (Christopher Nolan)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (17, 9, 'Inception', TO_DATE('2010-07-16', 'YYYY-MM-DD'), 148, 'Engleza', 'Un hot care intra in visele altora pentru a fura idei incearca sa indeplineasca o ultima misiune de "implantare" a unei idei.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (18, 9, 'The Dark Knight', TO_DATE('2008-07-18', 'YYYY-MM-DD'), 152, 'Engleza', 'Batman se confrunta cu un nou inamic, Jokerul, care ameninta sa distruga Gotham City.');

-- Filme din Marea Britanie (Alfred Hitchcock)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (19, 10, 'Psycho', TO_DATE('1960-09-08', 'YYYY-MM-DD'), 109, 'Engleza', 'O femeie dispare dupa ce fura bani si se refugiaza intr-un motel izolat, unde intalneste un barbat bizar.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (20, 10, 'Rear Window', TO_DATE('1954-08-01', 'YYYY-MM-DD'), 112, 'Engleza', 'Un barbat aflat in recuperare de la o accidentare incepe sa suspecteze ca unul dintre vecinii sai a comis o crima.');

-- Filme din Spania (Pedro Almodovar)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (21, 11, 'Talk to Her', TO_DATE('2002-03-22', 'YYYY-MM-DD'), 112, 'Spaniola', 'Povestea a doi barbati care se ingrijesc de doua femei aflate intr-o stare comatoasa.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (22, 11, 'Volver', TO_DATE('2006-03-17', 'YYYY-MM-DD'), 121, 'Spaniola', 'O femeie se intoarce in satul ei natal pentru a rezolva misterul mortii mamei sale.');

-- Filme din Spania (Luis Bunuel)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (23, 12, 'The Discreet Charm of the Bourgeoisie', TO_DATE('1972-11-01', 'YYYY-MM-DD'), 102, 'Franceza', 'O poveste absurda despre un grup de burghezi care nu reusesc niciodata sa manance impreuna.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (24, 12, 'Un Chien Andalou', TO_DATE('1929-06-06', 'YYYY-MM-DD'), 21, 'Franceza', 'Un scurtmetraj de avangarda care combina imagini bizare si neclare, fara o poveste coerenta.');

-- Filme din Suedia (Ingmar Bergman)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (25, 13, 'The Seventh Seal', TO_DATE('1957-02-15', 'YYYY-MM-DD'), 96, 'Suedeza', 'Un cavaler medieval joaca sah cu Moartea in timpul Ciumei din Europa.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (26, 13, 'Wild Strawberries', TO_DATE('1957-08-25', 'YYYY-MM-DD'), 91, 'Suedeza', 'Un medic in varsta reflecteaza asupra vietii sale, in timp ce calatoreste pentru a primi o distinctie.');

-- Filme din Canada (David Cronenberg)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (27, 14, 'Videodrome', TO_DATE('1983-02-04', 'YYYY-MM-DD'), 87, 'Engleza', 'Un barbat devine obsedat de un program TV care pare sa controleze mintile oamenilor.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (28, 14, 'The Fly', TO_DATE('1986-08-15', 'YYYY-MM-DD'), 96, 'Engleza', 'Un om de stiinta isi transforma corpul intr-o masa de mu?te dupa un experiment esuat.');

-- Filme din Canada (Denis Villeneuve)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (29, 15, 'Arrival', TO_DATE('2016-11-11', 'YYYY-MM-DD'), 116, 'Engleza', 'O lingvistica ajuta la comunicarea cu extratere?tri care au aterizat pe Pamant.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (30, 15, 'Blade Runner 2049', TO_DATE('2017-10-06', 'YYYY-MM-DD'), 164, 'Engleza', 'Un blade runner descopera un secret care ameninta sa schimbe intreaga societate.');

-- Filme din Polonia (Roman Polanski)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (31, 16, 'Rosemary`s Baby', TO_DATE('1968-06-12', 'YYYY-MM-DD'), 137, 'Engleza', 'O femeie insarcinata incepe sa suspecteze ca sotul ei este implicat intr-un cult satanic.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (32, 16, 'The Pianist', TO_DATE('2002-09-28', 'YYYY-MM-DD'), 148, 'Engleza', 'Un pianist polonez supravietuieste invaziei naziste in Varsovia, dar este nevoit sa traiasca in subteran.');

-- Filme din Polonia (Andrzej Wajda)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (33, 17, 'Man of Iron', TO_DATE('1981-08-01', 'YYYY-MM-DD'), 153, 'Polona', 'Un jurnalist urmareste evenimentele din Polonia, in timpul protestelor muncitoresti din 1980.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (34, 17, 'Ashes and Diamonds', TO_DATE('1958-03-01', 'YYYY-MM-DD'), 103, 'Polona', 'Un tanar luptator rezistent polonez este trimis sa ucida un ofiter al armatei sovietice.');

-- Filme din Japonia (Akira Kurosawa)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (35, 18, 'Seven Samurai', TO_DATE('1954-04-26', 'YYYY-MM-DD'), 207, 'Japoneza', 'Un grup de samurai sunt angajati sa apere un sat de banditi.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (36, 18, 'Rashomon', TO_DATE('1950-08-25', 'YYYY-MM-DD'), 88, 'Japoneza', 'Patru martori ofera versiuni contradictorii ale acelorasi evenimente, creand o meditatie despre adevar si perceptie.');

-- Filme din Japonia (Hayao Miyazaki)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (37, 19, 'Spirited Away', TO_DATE('2001-07-20', 'YYYY-MM-DD'), 125, 'Japoneza', 'O fata ajunge intr-o lume magica unde trebuie sa salveze parintii ei transformati in porci.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (38, 19, 'My Neighbor Totoro', TO_DATE('1988-04-16', 'YYYY-MM-DD'), 86, 'Japoneza', 'Doua surori se muta la tara si descopera creaturi magice care locuiesc acolo.');

-- Filme din Romania (Cristian Mungiu)
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (39, 20, '4 Months, 3 Weeks and 2 Days', TO_DATE('2007-08-17', 'YYYY-MM-DD'), 113, 'Romana', 'Doua studente din Romania anilor 1980 incearca sa obtina o intrerupere de sarcina ilegala.');
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere) 
VALUES (40, 20, 'Beyond the Hills', TO_DATE('2012-04-06', 'YYYY-MM-DD'), 155, 'Romana', 'Doua tinere care au crescut impreuna intr-un orfelinat incearca sa se reuneasca intr-un convent din Romania.');


---------------------------------------------------------------

-- inserarea valorilor din tabela Platforme

INSERT INTO Platforme (id_platforma, nume, cost_lunar)
VALUES (1, 'Netflix', 15.99);

INSERT INTO Platforme (id_platforma, nume, cost_lunar)
VALUES (2, 'Amazon Prime Video', 12.99);

INSERT INTO Platforme (id_platforma, nume, cost_lunar)
VALUES (3, 'Hulu', 11.99);

INSERT INTO Platforme (id_platforma, nume, cost_lunar)
VALUES (4, 'Disney+', 7.99);

INSERT INTO Platforme (id_platforma, nume, cost_lunar)
VALUES (5, 'HBO Max', 14.99);

INSERT INTO Platforme (id_platforma, nume, cost_lunar)
VALUES (6, 'Apple TV+', 9.99);

select * from Platforme;

---------------------------------------------------------------

-- inserarea valorilor din tabela Genuri

INSERT INTO Genuri (id_gen, gen) VALUES (1, 'Drama');
INSERT INTO Genuri (id_gen, gen) VALUES (2, 'Istoric');
INSERT INTO Genuri (id_gen, gen) VALUES (3, 'Aventura');
INSERT INTO Genuri (id_gen, gen) VALUES (4, 'Sci-Fi');
INSERT INTO Genuri (id_gen, gen) VALUES (5, 'Thriller');
INSERT INTO Genuri (id_gen, gen) VALUES (6, 'Actiune');
INSERT INTO Genuri (id_gen, gen) VALUES (7, 'Comedie');
INSERT INTO Genuri (id_gen, gen) VALUES (8, 'Romantic');
INSERT INTO Genuri (id_gen, gen) VALUES (9, 'Mister');
INSERT INTO Genuri (id_gen, gen) VALUES (10, 'Horror');
INSERT INTO Genuri (id_gen, gen) VALUES (11, 'Tensiune psihologica');
INSERT INTO Genuri (id_gen, gen) VALUES (12, 'Fantasie');
INSERT INTO Genuri (id_gen, gen) VALUES (13, 'Melodrama');
INSERT INTO Genuri (id_gen, gen) VALUES (14, 'Poli?ist');
INSERT INTO Genuri (id_gen, gen) VALUES (15, 'Avangard?');

Select * from Genuri;

-- Inserarea valorilor in tabela asociativa Filme_Genuri

-- Schindler's List (Drama, Istoric)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (1, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (1, 2);

-- Jurassic Park (Aventura, Sci-Fi)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (2, 3);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (2, 4);

-- Pulp Fiction (Thriller, Actiune)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (3, 5);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (3, 6);

-- Kill Bill: Vol. 1 (Actiune, Thriller)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (4, 6);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (4, 5);

-- The 400 Blows (Drama, Romantic)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (5, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (5, 8);

-- Fahrenheit 451 (Drama, Sci-Fi)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (6, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (6, 4);

-- Breathless (Aventura, Romantic)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (7, 3);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (7, 8);

-- Alphaville (Sci-Fi, Mister)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (8, 4);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (8, 9);

-- 8½ (Drama, Comedie, Romantic)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (9, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (9, 7);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (9, 8);

-- La Dolce Vita (Drama, Comedie)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (10, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (10, 7);

-- Blow-Up (Mister, Thriller)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (11, 9);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (11, 5);

-- Red Desert (Drama, Mister)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (12, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (12, 9);

-- Aguirre, the Wrath of God (Drama, Aventura)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (13, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (13, 3);

-- Fitzcarraldo (Drama, Aventura)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (14, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (14, 3);

-- Ali: Fear Eats the Soul (Drama, Romantic)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (15, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (15, 8);

-- The Marriage of Maria Braun (Drama, Melodrama)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (16, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (16, 13);

-- Inception (Sci-Fi, Thriller)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (17, 4);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (17, 5);

-- The Dark Knight (Actiune, Thriller)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (18, 6);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (18, 5);

-- Psycho (Thriller, Mister)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (19, 5);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (19, 9);

-- Rear Window (Mister, Thriller)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (20, 9);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (20, 5);

-- Talk to Her (Drama, Romantic)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (21, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (21, 8);

-- Volver (Drama, Romantic)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (22, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (22, 8);

-- The Discreet Charm of the Bourgeoisie (Comedie, Avangard?)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (23, 7);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (23, 15);

-- Un Chien Andalou (Avangard?)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (24, 15);

-- The Seventh Seal (Drama, Filosofic)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (25, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (25, 9);

-- Wild Strawberries (Drama, Romantic)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (26, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (26, 8);

-- Videodrome (Sci-Fi, Horror)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (27, 4);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (27, 10);

-- The Fly (Sci-Fi, Horror)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (28, 4);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (28, 10);

-- Arrival (Drama, Sci-Fi)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (29, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (29, 4);

-- Blade Runner 2049 (Sci-Fi, Thriller)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (30, 4);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (30, 5);

-- Rosemary's Baby (Horror, Mister)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (31, 10);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (31, 9);

-- The Pianist (Drama, Istoric)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (32, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (32, 2);

-- Man of Iron (Drama, Istoric)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (33, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (33, 2);

-- Ashes and Diamonds (Drama, Istoric)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (34, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (34, 2);

-- Seven Samurai (Actiune, Aventura)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (35, 6);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (35, 3);

-- Rashomon (Drama, Mister)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (36, 1);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (36, 9);

-- Spirited Away (Fantasie, Aventura)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (37, 12);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (37, 3);

-- My Neighbor Totoro (Fantasie, Comedie)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (38, 12);
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (38, 7);

-- 4 Months, 3 Weeks and 2 Days (Drama)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (39, 1);

-- Beyond the Hills (Drama)
INSERT INTO Filme_Genuri (id_film, id_gen) VALUES (40, 1);

Select * from Filme_Genuri;

------------------------------

-- Utilizatori din România
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (1, 11, 'numauitlafilme', 'tudor_iordache@gmail.com', 'Iordache', 'Tudor', 'Cinefil pasionat de filme clasice.', TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (2, 11, 'rarescara', 'rares.cara@yahoo.com', 'Cara', 'Rares', 'Ador filmele SF si dramele istorice.', TO_DATE('2022-11-20', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (3, 11, 'eduardavram', 'avram.eduard@outlook.com', 'Avram', 'Eduard', 'Critic amator, scriu despre filmele pe care le vad.', TO_DATE('2021-06-05', 'YYYY-MM-DD'));

-- Utilizatori din Statele Unite
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (4, 1, 'madjon', 'madison.jones@gmail.com', 'Jones', 'Madison', 'Fan al filmelor de aventura si comedii.', TO_DATE('2020-09-12', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (5, 1, 'daniels', 'daniel.smith@yahoo.com', 'Smith', 'Daniel', 'Scriu recenzii pentru filme pe blogul meu.', TO_DATE('2022-03-18', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (6, 1, 'emilyyy', 'emily.brown@hotmail.com', 'Brown', 'Emily', 'Dependenta de arta.', TO_DATE('2021-12-05', 'YYYY-MM-DD'));

-- Utilizatori din Fran?a
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (7, 2, 'martinlou', 'louis.martin@orange.fr', 'Martin', 'Louis', 'Pasionat de filme franceze si cinema international.', TO_DATE('2023-02-10', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (8, 2, 'amelielemonde', 'amelie.lemonde@gmail.com', 'Lemonde', 'Amelie', 'Scriu despre filme de animatie si documentare.', TO_DATE('2022-07-25', 'YYYY-MM-DD'));

-- Utilizatori din Italia
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (9, 3, 'filmfan_luca', 'luca.rossi@libero.it', 'Rossi', 'Luca', 'Ador cinema-ul italian clasic si thrillerele moderne.', TO_DATE('2020-08-30', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (10, 3, 'valeria_f', 'valeria.bianchi@yahoo.it', 'Bianchi', 'Valeria', 'Fana a filmelor romantice si dramelor psihologice.', TO_DATE('2021-03-22', 'YYYY-MM-DD'));

-- Utilizatori din Germania
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (11, 4, 'sebyschmidt', 'sebastian.schmidt@web.de', 'Schmidt', 'Sebastian', 'Scriu critici despre filme europene.', TO_DATE('2019-11-15', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (12, 4, 'anna_movies', 'anna.muller@gmx.de', 'Muller', 'Anna', 'Ador filmele biografice si dramele istorice.', TO_DATE('2020-06-09', 'YYYY-MM-DD'));

-- Utilizatori din Marea Britanie
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (13, 5, 'jamiecl', 'james.clarke@hotmail.co.uk', 'Clarke', 'James', 'Fan al filmelor britanice si al misterelor.', TO_DATE('2022-04-18', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (14, 5, 'elizabeth_cinema', 'elizabeth.king@gmail.com', 'King', 'Elizabeth', 'Imi plac filmele de epoca si povestile fantastice.', TO_DATE('2021-11-01', 'YYYY-MM-DD'));

-- Utilizatori din Spania
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (15, 6, 'carlitogarcia', 'carlos.garcia@outlook.es', 'Garcia', 'Carlos', 'Scriu despre filme spaniole si latino-americane.', TO_DATE('2020-12-30', 'YYYY-MM-DD'));

-- Utilizatori din Suedia
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (16, 7, 'emmaaan_', 'emma.nilsson@hotmail.se', 'Nilsson', 'Emma', 'Fana a filmelor nordice si dramele intunecate.', TO_DATE('2019-10-11', 'YYYY-MM-DD'));

-- Utilizatori din Canada
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (17, 8, 'jacobmartin', 'jacob.martin@gmail.ca', 'Martin', 'Jacob', 'Ador filmele de groaza si thrillerele psihologice.', TO_DATE('2021-05-04', 'YYYY-MM-DD'));

-- Utilizatori din Polonia
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (18, 9, 'aniakkk', 'ania.kowalska@gmail.pl', 'Kowalska', 'Ania', 'Scriu despre filmele poloneze si europene.', TO_DATE('2023-03-27', 'YYYY-MM-DD'));

-- Utilizatori din Japonia
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (19, 10, 'hiroletterboxd', 'hiro.takahashi@yahoo.jp', 'Takahashi', 'Hiro', 'Fan al filmelor de animatie si samurai.', TO_DATE('2022-01-10', 'YYYY-MM-DD'));

-- Alti utilizatori (aleatoriu)
INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (20, 3, 'LuKaS', 'lucas.bernardo@gmail.com', 'Bernardo', 'Lucas', 'Scriu despre filme de aventura.', TO_DATE('2021-07-19', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (21, 6, 'mariahhh', 'maria.lopez@yahoo.es', 'Lopez', 'Maria', 'Ador dramele sociale si povestile puternice.', TO_DATE('2022-09-14', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (22, 1, 'classicalpeter', 'peter.johnson@gmail.com', 'Johnson', 'Peter', 'Fan al filmelor clasice americane.', TO_DATE('2019-08-23', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (23, 5, 'alicevans', 'alice.evans@hotmail.co.uk', 'Evans', 'Alice', 'Pasionata de filmele romantice si povestile inspirationale.', TO_DATE('2023-04-05', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (24, 4, 'leon_sf', 'leon.keller@gmx.de', 'Keller', 'Leon', 'Fan al filmelor de actiune si science-fiction.', TO_DATE('2022-08-21', 'YYYY-MM-DD'));

INSERT INTO Utilizatori (id_utilizator, id_tara, username, email, nume, prenume, biografie, data_inregistrare) 
VALUES (25, 7, 'northernsaga', 'saga.nilsson@hotmail.se', 'Nilsson', 'Saga', 'Scriu despre filmele nordice si povestile psihologice.', TO_DATE('2021-10-01', 'YYYY-MM-DD'));

------------------------------------------------------------

-- Inserarea valorilor in tabela Note

-- Schindler's List
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (1, 1, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (2, 1, 8);

-- Jurassic Park
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (3, 2, 7);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (4, 2, 9);

-- Pulp Fiction
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (5, 3, 10);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (6, 3, 9);

-- Kill Bill: Vol. 1
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (7, 4, 8);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (8, 4, 7);

-- The 400 Blows
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (9, 5, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (10, 5, 8);

-- Fahrenheit 451
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (11, 6, 7);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (12, 6, 6);

-- Breathless
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (13, 7, 8);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (14, 7, 9);

-- Alphaville
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (15, 8, 7);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (16, 8, 8);

-- 8½
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (17, 9, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (18, 9, 10);

-- La Dolce Vita
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (19, 10, 8);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (20, 10, 9);

-- Blow-Up
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (21, 11, 7);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (22, 11, 8);

-- Red Desert
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (23, 12, 6);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (24, 12, 7);

-- Aguirre, the Wrath of God
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (25, 13, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (1, 13, 8);

-- Fitzcarraldo
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (2, 14, 7);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (3, 14, 9);

-- Ali: Fear Eats the Soul
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (4, 15, 8);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (5, 15, 7);

-- The Marriage of Maria Braun
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (6, 16, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (7, 16, 8);

-- Inception
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (8, 17, 10);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (9, 17, 9);

-- The Dark Knight
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (10, 18, 10);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (11, 18, 9);

-- Psycho
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (12, 19, 8);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (13, 19, 9);

-- Rear Window
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (14, 20, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (15, 20, 8);

-- Talk to Her
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (16, 21, 7);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (17, 21, 8);

-- Volver
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (18, 22, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (19, 22, 8);

-- The Discreet Charm of the Bourgeoisie
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (20, 23, 7);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (21, 23, 8);

-- Un Chien Andalou
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (22, 24, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (23, 24, 7);

-- The Seventh Seal
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (24, 25, 8);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (25, 25, 9);

-- Wild Strawberries
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (1, 26, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (2, 26, 8);

-- Videodrome
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (3, 27, 7);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (4, 27, 8);

-- The Fly
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (5, 28, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (6, 28, 8);

-- Arrival
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (7, 29, 10);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (8, 29, 9);

-- Blade Runner 2049
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (9, 30, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (10, 30, 10);

-- Rosemary's Baby
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (11, 31, 8);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (12, 31, 9);

-- The Pianist
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (13, 32, 10);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (14, 32, 9);

-- Man of Iron
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (15, 33, 8);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (16, 33, 9);

-- Ashes and Diamonds
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (17, 34, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (18, 34, 8);

-- Seven Samurai
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (19, 35, 10);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (20, 35, 9);

-- Rashomon
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (21, 36, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (22, 36, 8);

-- Spirited Away
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (23, 37, 10);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (24, 37, 9);

-- My Neighbor Totoro
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (25, 38, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (1, 38, 8);

-- 4 Months, 3 Weeks and 2 Days
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (2, 39, 9);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (3, 39, 8);

-- Beyond the Hills
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (4, 40, 7);
INSERT INTO Note (id_utilizator, id_film, nota) VALUES (5, 40, 8);

------------------------------------------------------------------

-- inserarea valorilor in tabela recenzii

-- Inserarea valorilor in tabela Recenzii

-- Schindler's List
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (1, 1, 1, 'Emotional si puternic.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (2, 2, 1, 'Un film de neuitat.');

-- Jurassic Park
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (3, 3, 2, 'Efecte speciale uimitoare.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (4, 4, 2, 'Aventura captivanta.');

-- Pulp Fiction
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (5, 5, 3, 'Dialoguri memorabile.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (6, 6, 3, 'Un clasic modern.');

-- Kill Bill: Vol. 1
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (7, 7, 4, 'Actiune intensa.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (8, 8, 4, 'Stil vizual unic.');

-- The 400 Blows
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (9, 9, 5, 'Profund si emotionant.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (10, 10, 5, 'Un portret realist.');

-- Fahrenheit 451
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (11, 11, 6, 'O distopie captivanta.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (12, 12, 6, 'Teme provocatoare.');

-- Breathless
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (13, 13, 7, 'Revolutionar pentru vremea sa.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (14, 14, 7, 'Stil inovator.');

-- Alphaville
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (15, 15, 8, 'Un SF neconventional.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (16, 16, 8, 'Atmosfera misterioasa.');

-- 8½
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (17, 17, 9, 'O capodopera cinematografica.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (18, 18, 9, 'Un film fascinant.');

-- La Dolce Vita
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (19, 19, 10, 'Un portret al societatii.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (20, 20, 10, 'O poveste captivanta.');

-- Blow-Up
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (21, 21, 11, 'Intrigant si misterios.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (22, 22, 11, 'Un film provocator.');

-- Red Desert
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (23, 23, 12, 'Vizual impresionant.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (24, 24, 12, 'O poveste profunda.');

-- Aguirre, the Wrath of God
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (25, 25, 13, 'O aventura epica.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (26, 1, 13, 'Un film captivant.');

-- Fitzcarraldo
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (27, 2, 14, 'O poveste incredibila.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (28, 3, 14, 'Inspirational si epic.');

-- Ali: Fear Eats the Soul
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (29, 4, 15, 'Emotional si puternic.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (30, 5, 15, 'O poveste de iubire.');

-- The Marriage of Maria Braun
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (31, 6, 16, 'Dramatic si captivant.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (32, 7, 16, 'Un film remarcabil.');

-- Inception
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (33, 8, 17, 'Un SF inovator.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (34, 9, 17, 'Complex si captivant.');

-- The Dark Knight
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (35, 10, 18, 'Un thriller intens.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (36, 11, 18, 'Un film de actiune epic.');

-- Psycho
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (37, 12, 19, 'Un clasic al genului.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (38, 13, 19, 'Suspans si mister.');

-- Rear Window
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (39, 14, 20, 'Un thriller captivant.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (40, 15, 20, 'Un film de suspans.');

-- Talk to Her
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (41, 16, 21, 'O poveste emotionanta.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (42, 17, 21, 'Profund si captivant.');

-- Volver
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (43, 18, 22, 'Un film impresionant.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (44, 19, 22, 'O poveste captivanta.');

-- The Discreet Charm of the Bourgeoisie
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (45, 20, 23, 'Un film absurd.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (46, 21, 23, 'O comedie neconventionala.');

-- Un Chien Andalou
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (47, 22, 24, 'Un scurtmetraj bizar.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (48, 23, 24, 'Imagini socante.');

-- The Seventh Seal
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (49, 24, 25, 'Un film filosofic.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (50, 25, 25, 'Profund si simbolic.');

-- Wild Strawberries
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (51, 1, 26, 'O calatorie introspectiva.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (52, 2, 26, 'Un film emotionant.');

-- Videodrome
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (53, 3, 27, 'Un SF provocator.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (54, 4, 27, 'Un film socant.');

-- The Fly
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (55, 5, 28, 'Un horror captivant.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (56, 6, 28, 'Un film terifiant.');

-- Arrival
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (57, 7, 29, 'Un SF inteligent.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (58, 8, 29, 'O poveste captivanta.');

-- Blade Runner 2049
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (59, 9, 30, 'Un SF vizual impresionant.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (60, 10, 30, 'Un film captivant.');

-- Rosemary's Baby
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (61, 11, 31, 'Un horror clasic.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (62, 12, 31, 'Un film terifiant.');

-- The Pianist
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (63, 13, 32, 'O drama emotionanta.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (64, 14, 32, 'Un film puternic.');

-- Man of Iron
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (65, 15, 33, 'Un film istoric.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (66, 16, 33, 'O poveste captivanta.');

-- Ashes and Diamonds
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (67, 17, 34, 'Un film simbolic.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (68, 18, 34, 'O poveste puternica.');

-- Seven Samurai
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (69, 19, 35, 'Un film epic.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (70, 20, 35, 'O poveste captivanta.');

-- Rashomon
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (71, 21, 36, 'Un film inovator.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (72, 22, 36, 'O poveste captivanta.');

-- Spirited Away
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (73, 23, 37, 'Un film magic.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (74, 24, 37, 'O poveste captivanta.');

-- My Neighbor Totoro
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (75, 25, 38, 'Un film fermecator.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (76, 1, 38, 'O poveste magica.');

-- 4 Months, 3 Weeks and 2 Days
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (77, 2, 39, 'Un film puternic.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (78, 3, 39, 'O poveste emotionanta.');

-- Beyond the Hills
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (79, 4, 40, 'Un film profund.');
INSERT INTO Recenzii (id_recenzie, id_utilizator, id_film, recenzie) VALUES (80, 5, 40, 'O poveste captivanta.');

------------------------------------------------------------------

--Inserarea valorilor in tabela Filme_Platforme

-- Inserarea valorilor in tabela Filme_Platforme

-- Schindler's List
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (1, 1);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (1, 2);

-- Jurassic Park
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (2, 1);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (2, 3);

-- Pulp Fiction
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (3, 2);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (3, 4);

-- Kill Bill: Vol. 1
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (4, 3);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (4, 5);

-- The 400 Blows
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (5, 4);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (5, 6);

-- Fahrenheit 451
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (6, 5);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (6, 1);

-- Breathless
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (7, 6);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (7, 2);

-- Alphaville
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (8, 1);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (8, 3);

-- 8½
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (9, 2);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (9, 4);

-- La Dolce Vita
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (10, 3);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (10, 5);

-- Blow-Up
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (11, 4);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (11, 6);

-- Red Desert
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (12, 5);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (12, 1);

-- Aguirre, the Wrath of God
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (13, 6);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (13, 2);

-- Fitzcarraldo
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (14, 1);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (14, 3);

-- Ali: Fear Eats the Soul
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (15, 2);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (15, 4);

-- The Marriage of Maria Braun
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (16, 3);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (16, 5);

-- Inception
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (17, 4);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (17, 6);

-- The Dark Knight
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (18, 5);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (18, 1);

-- Psycho
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (19, 6);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (19, 2);

-- Rear Window
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (20, 1);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (20, 3);

-- Talk to Her
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (21, 2);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (21, 4);

-- Volver
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (22, 3);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (22, 5);

-- The Discreet Charm of the Bourgeoisie
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (23, 4);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (23, 6);

-- Un Chien Andalou
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (24, 5);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (24, 1);

-- The Seventh Seal
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (25, 6);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (25, 2);

-- Wild Strawberries
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (26, 1);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (26, 3);

-- Videodrome
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (27, 2);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (27, 4);

-- The Fly
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (28, 3);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (28, 5);

-- Arrival
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (29, 4);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (29, 6);

-- Blade Runner 2049
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (30, 5);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (30, 1);

-- Rosemary's Baby
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (31, 6);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (31, 2);

-- The Pianist
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (32, 1);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (32, 3);

-- Man of Iron
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (33, 2);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (33, 4);

-- Ashes and Diamonds
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (34, 3);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (34, 5);

-- Seven Samurai
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (35, 4);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (35, 6);

-- Rashomon
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (36, 5);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (36, 1);

-- Spirited Away
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (37, 6);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (37, 2);

-- My Neighbor Totoro
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (38, 1);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (38, 3);

-- 4 Months, 3 Weeks and 2 Days
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (39, 2);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (39, 4);

-- Beyond the Hills
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (40, 3);
INSERT INTO Filme_Platforme (id_film, id_platforma) VALUES (40, 5);


------------------------------------------------------------------

-- inserarea valorilor in tabela liste_filme

-- Inserarea valorilor in tabela Liste_Filme

-- Inserarea valorilor in tabela Liste_Filme

INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (1, 1, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (2, 2, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (3, 3, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (4, 4, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (5, 5, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (6, 6, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (7, 7, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (8, 8, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (9, 9, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (10, 10, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (11, 11, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (12, 12, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (13, 13, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (14, 14, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (15, 15, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (16, 16, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (17, 17, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (18, 18, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (19, 19, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (20, 20, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (21, 21, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (22, 22, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (23, 23, 'PRIVAT');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (24, 24, 'PUBLIC');
INSERT INTO Liste_Filme (id_lista_filme, id_utilizator, securitate) VALUES (25, 25, 'PRIVAT');

------------------------------------------------------------------

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (3, 1);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (4, 1);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (5, 2);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (6, 2);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (7, 3);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (8, 3);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (9, 4);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (10, 4);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (11, 5);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (12, 5);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (13, 6);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (14, 6);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (15, 7);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (16, 7);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (17, 8);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (18, 8);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (19, 9);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (20, 9);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (21, 10);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (22, 10);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (23, 11);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (24, 11);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (25, 12);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (26, 12);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (27, 13);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (28, 13);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (29, 14);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (30, 14);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (31, 15);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (32, 15);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (33, 16);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (34, 16);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (35, 17);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (36, 17);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (37, 18);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (38, 18);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (39, 19);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (40, 19);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (1, 20);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (2, 20);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (3, 21);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (4, 21);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (5, 22);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (6, 22);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (7, 23);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (8, 23);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (9, 24);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (10, 24);

INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (11, 25);
INSERT INTO Filme_Liste_Filme (id_film, id_lista_filme) VALUES (12, 25);

------------------------------------------------------------------


Select * from Utilizatori; --done
Select * from Tari; --done
Select * from Regizori; --done
Select * from Filme; --done
Select * from Genuri; --done
Select * from Filme_Genuri; --done
Select * from Note; --done
Select * from Liste_Filme; --done 
Select * from Filme_Liste_Filme; --done
Select * from Recenzii; --done
Select * from Platforme; --done
Select * from Filme_Platforme; --done

------------------------------------------------------------------




