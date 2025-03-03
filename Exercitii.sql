SET VERIFY OFF
SET SERVEROUTPUT ON

-- Exercitiul 6. Problema folosind un subprogram stocat independent 
-- care sa utilizeze toate cele 3 tipuri de colectii studiate.


-- Pentru o platforma si o nota date, afisati detalii despre 
-- toate filmele (nume film, nume regizor, nota medie)
-- care pot fi vizionate pe platforma respectiva 
-- si care au media notelor mai mare decat parametrul dat.

create or replace type filme_array as varray(20) of varchar2(80);

create or replace procedure filme_dupa_platforma_si_nota
(v_nume_platforma Platforme.nume%TYPE, 
 v_nota number)
as
  -- tablou indexat pentru numele regizorilor
  type regizori_array is table of Regizori.nume%TYPE index by pls_integer;
  v_regizori regizori_array;
  
  -- tablou imbricat pentru nota medie
  type note_medii is table of number;
  v_note_medii note_medii := note_medii(); 
  
  -- vectorul cu filme
  v_filme filme_array := filme_array(); 
  
  -- counter
  cnt integer := 1;
  
BEGIN
  -- folosirea unui ciclu cursor
  for i in 
  (
  select f.titlu as titlu_film, avg(nota) as nota_medie, r.nume as nume_regizor from 
  filme f join note n
  on f.id_film = n.id_film
  join regizori r
  on f.id_regizor = r.id_regizor
  join filme_platforme fp 
  on f.id_film = fp.id_film
  join platforme p
  on fp.id_platforma = p.id_platforma
  where p.nume = v_nume_platforma
  group by f.titlu, r.nume
  having avg(nota) > v_nota
  ) loop
  v_regizori(cnt) := i.nume_regizor;
  v_note_medii.extend; 
  v_note_medii(cnt) := i.nota_medie;
  v_filme.extend; 
  v_filme(cnt) := i.titlu_film;
  cnt := cnt + 1;
  END LOOP;
  DBMS_OUTPUT.PUT('Pe platforma ' || v_nume_platforma || ', cu o medie mai mare de ' || v_nota);
  -- se verifica cazul in care nu exista filme (practic counter-ul ramanand la 1)
  IF cnt = 1 THEN
  DBMS_OUTPUT.PUT_LINE(', nu exista filme');
  ELSE
  DBMS_OUTPUT.PUT(', avem urmatoarele filme:
');
  FOR i IN 1..v_filme.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(v_filme(i) || 
                         ', Regizor: ' || v_regizori(i) || 
                         ', Nota medie: ' || v_note_medii(i));
  END LOOP;
  END IF;
END;
/
BEGIN
  filme_dupa_platforma_si_nota('Netflix', 8);
END;
/

------------------------------------------------------------------------------

-- Exercitiul 7. subprogram stocat independent 
-- care sa utilizeze 2 tipuri diferite de cursoare studiate, 
-- unul dintre acestea fiind cursor
-- parametrizat, dependent de celalalt cursor

-- Pentru un film cu id dat, sa se afiseze toti utilizatorii (nume utilizator + id)
-- care au filmul salvat in lista lor de filme.

Create or replace procedure film_cu_utilizatori(filmId Filme.id_film%TYPE)
as 
    -- in cursorul principal se adauga toate listele de filme care au filmul cerut salvat
    cursor c_liste_filme is
    select lf.id_lista_filme 
    from liste_filme lf
    join filme_liste_Filme flf on lf.id_lista_filme = flf.id_lista_filme
    join filme f on flf.id_film = f.id_film
    where f.id_film = filmId;
    
    -- cursoru parametrizat afiseaza utilizatorul care are lista de filme ceruta
    cursor c_utilizatori(p_id_lista_filme liste_filme.id_lista_filme%TYPE) is
    select u.id_utilizator, u.username
    from utilizatori u 
    join liste_filme lf on u.id_utilizator = lf.id_utilizator
    where lf.id_lista_filme = p_id_lista_filme;
    
    v_id_utilizator Utilizatori.id_utilizator%TYPE;
    
    v_username Utilizatori.username%TYPE;
    
    v_numar_filme NUMBER := 0;
    
    v_numar_utilizatori NUMBER := 0;
    
BEGIN
    select count(*) into v_numar_filme
    from Filme
    where id_film = filmId;
    
    select count(lf.id_utilizator) into v_numar_utilizatori
    from Liste_filme lf join Filme_Liste_Filme flf
    on lf.id_lista_filme = flf.id_lista_filme
    join Filme f on flf.id_film = f.id_film
    where f.id_film = filmId;
    
    if v_numar_filme = 0 then
        RAISE_APPLICATION_ERROR(-20000, 'Nu exista filme cu id-ul dat!');
        RETURN;
    end if;
    
    if v_numar_utilizatori = 0 then
        RAISE_APPLICATION_ERROR(-20001, 'Nu exista utilizatori sa aiba acest film in lista lor!');
        RETURN;
    end if;
    
    for lista_filme in c_liste_filme loop
        open c_utilizatori(lista_filme.id_lista_filme);
        LOOP
            fetch c_utilizatori into v_id_utilizator, v_username;
            exit when c_utilizatori%notfound;
            DBMS_OUTPUT.PUT_LINE('Id_utilizator: ' || v_id_utilizator || ', Username: ' || v_username);
        END LOOP;
        close c_utilizatori;
    END LOOP;  
END;
/

BEGIN
film_cu_utilizatori(1);
END;
/

select * from filme;
INSERT INTO Filme (id_film, id_regizor, titlu, an_lansare, durata_minute, limba, descriere)
VALUES (41, 1, 'Film Random', TO_DATE('2023-12-15', 'YYYY-MM-DD'), 120, 'Romana', 'Acesta este un film random.');
delete from filme
where id_film = 41;

------------------------------------------------------------------------------------------------------------------

-- Exercitiul 10. Defini?i un trigger de tip LMD la nivel de comand?. Declan?a?i trigger-ul.

-- Trigger care nu permite stergerea filmelor care au recenzii asupra lor din baza de date.
CREATE OR REPLACE TRIGGER stergere_filme
BEFORE DELETE ON Filme
DECLARE
    cnt_recenzii NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO cnt_recenzii
    FROM Recenzii
    WHERE id_film in (select id_film from Filme);
    IF cnt_recenzii > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nu poti sterge acest film din baza de date fara a sterge recenziile aferente.');
    END IF;
END;
/

delete from Filme where id_film = 1;
drop Trigger stergere_filme;


-------------------------------------------------------------------------------------------------------------------

-- Exercitiul 11. Defini?i un trigger de tip LMD la nivel de linie. Declan?a?i trigger-ul.

-- Trigger care se declanseaza la inserarea in tabela regizori si care verifica tara, varsta si unicitatea numelui 

CREATE OR REPLACE TRIGGER adauga_regizor
BEFORE INSERT ON Regizori
FOR EACH ROW
DECLARE
    function exista_tara(p_id_tara NUMBER) 
    RETURN INTEGER 
    IS 
    rezultat INTEGER;
    BEGIN
        select count(*) 
        into rezultat
        from Tari
        where id_tara = p_id_tara;
    IF rezultat >= 1 THEN
        Return 1;
    END IF;
    Return 0;
    END;
    
    function exista_regizor(p_nume varchar2, p_prenume varchar2)
    RETURN NUMBER
    IS
    rezultat INTEGER;
    BEGIN
        select count(*) 
        into rezultat
        from Regizori
        where nume = p_nume and prenume = p_prenume;
    IF rezultat >= 1 THEN
        Return 1;
    END IF;
        Return 0;
    END;
    
    function calculeaza_varsta(p_data_nasterii date)
    RETURN NUMBER
    IS
    rezultat INTEGER;
    BEGIN
        select floor (
                months_between ( sysdate, p_data_nasterii ) / 12
                     )
        into rezultat
        from Dual;
    Return rezultat; 
    END;
BEGIN
    IF exista_tara(:NEW.id_tara) = 0 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Nu se poate adauga un regizor din aceasta tara');
    END IF;
    
    IF exista_regizor(:NEW.nume, :NEW.prenume) = 1 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nu se poate adauga un regizor de doua ori');
    END IF;
    
    IF calculeaza_varsta(:New.data_nasterii) < 18 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Nu are varsta necesara pentru a fi adaugat pe platforma.');
    END IF;
END;
/

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii)
VALUES (100, 999, 'NumeInexistent', 'PrenumeInexistent', TO_DATE('1980-01-01', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii)
VALUES (101, 1, 'Spielberg', 'Steven', TO_DATE('1946-12-18', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii)
VALUES (102, 1, 'Tanar', 'Regizor', TO_DATE('2010-01-01', 'YYYY-MM-DD'));

INSERT INTO Regizori (id_regizor, id_tara, nume, prenume, data_nasterii)
VALUES (103, 1, 'NumeValid', 'PrenumeValid', TO_DATE('1985-05-15', 'YYYY-MM-DD'));

select * from Regizori;

delete from Regizori where id_regizor = 103;

drop Trigger adauga_regizor;


-------------------------------------------------------------------------------------

-- Exercitiul 12. Defini?i un trigger de tip LDD. Declan?a?i trigger-ul.

-- trigger care tine evidenta modificarilor din structura bazei de date
CREATE TABLE Modificari_Structura (
    utilizator VARCHAR2(50),    
    obiect_modificat VARCHAR2(50), 
    tip_modificare VARCHAR2(50),   
    data_modificare DATE          
);



CREATE OR REPLACE TRIGGER log_modificari_structura
AFTER ALTER OR DROP OR CREATE ON DATABASE
DECLARE
    v_nume_obiect VARCHAR2(50);  
    v_tip_obiect VARCHAR2(50);  
BEGIN
    v_nume_obiect := SYS.DICTIONARY_OBJ_NAME;
    v_tip_obiect := SYS.DICTIONARY_OBJ_TYPE;

    INSERT INTO Modificari_Structura (utilizator, obiect_modificat, tip_modificare, data_modificare)
    VALUES (USER, v_nume_obiect, ORA_SYSEVENT, SYSDATE);
END;
/

create table temporar(temp varchar2(30));
drop table temporar;
select * from Modificari_Structura;
drop trigger log_modificari_structura;
drop table Modificari_Structura;

--------------------------------------------------------------------------------

--Exercitiul 8. Formula?i în limbaj natural o problem? pe care s? o rezolva?i folosind un subprogram stocat
--independent de tip func?ie care s? utilizeze într-o singur? comand? SQL 3 dintre tabelele create.
--Trata?i toate excep?iile care pot ap?rea, incluzând excep?iile predefinite NO_DATA_FOUND ?i
--TOO_MANY_ROWS. Apela?i subprogramul astfel încât s? eviden?ia?i toate cazurile tratate

-- Sa se afiseze pentru un film si un utilizator dat, recenzia si nota oferite filmului respectiv
-- DOAR IN CAZUL IN CARE UTILIZATORUL A LASAT SI O NOTA SI O RECENZIE FILMULUI.

select r.recenzie, u.username, n.nota, f.titlu
from Recenzii r join Filme f
on r.id_film = f.id_film
join Utilizatori u
on u.id_utilizator = r.id_utilizator
join Note n 
on u.id_utilizator = n.id_utilizator and n.id_film = f.id_film;

select * from Note where id_utilizator = 1;
select * from Recenzii where id_utilizator = 1;

Create or replace function Recenzii_Note
(p_username IN Utilizatori.username%TYPE,
 p_film IN Filme.titlu%TYPE,
 v_rezultat OUT varchar2)
 
 RETURN varchar2 is
    v_utilizatori NUMBER;
    v_filme NUMBER;
    v_recenzii NUMBER;
    v_note NUMBER;
    username_sau_film_invalid EXCEPTION;
    username_sau_film_inexistent EXCEPTION;
    v_rez varchar2(1000);
    
 BEGIN
    --verificare username invalid
    IF p_username is NULL or p_film is NULL THEN
        RAISE username_sau_film_invalid;
    END IF;
    
    --verificare existenta utilizatori/filme
    select count(*) 
    into v_utilizatori
    from Utilizatori
    where username = p_username;
    
    select count(*)
    into v_filme
    from Filme
    where titlu = p_film;
    
    IF v_utilizatori = 0 or v_filme = 0 THEN
        RAISE username_sau_film_inexistent;
    END IF;
    
    --verificare numar recenzii
    select count(*)
    into v_recenzii
    from Utilizatori u join Recenzii r
    on u.id_utilizator = r.id_utilizator
    join Filme f on f.id_film = r.id_film
    where f.titlu = p_film
    and p_username = u.username;
    
    IF v_recenzii = 0 THEN
    RAISE no_data_found;
    ELSIF v_recenzii > 1 THEN
    RAISE too_many_rows;
    END IF;
    
    select count(*)
    into v_note
    from Utilizatori u join Note n
    on u.id_utilizator = n.id_utilizator
    join Filme f  on n.id_film = f.id_film
    where f.titlu = p_film
    and p_username = u.username;
    
    IF v_note = 0 THEN
    RAISE no_data_found;
    END IF;
    
    select 
    'Utilizator: ' || 
    u.username || ', Nota: ' || 
    n.nota || ', Recenzie: ' ||
    r.recenzie 
    into v_rez
    from Recenzii r join Filme f
    on r.id_film = f.id_film
    join Utilizatori u
    on u.id_utilizator = r.id_utilizator
    join Note n 
    on u.id_utilizator = n.id_utilizator and n.id_film = f.id_film
    where f.titlu = p_film
    and u.username = p_username;
    
    v_rezultat := v_rez;
    
    RETURN v_rezultat;
EXCEPTION
    WHEN no_data_found THEN
        v_rezultat := 'Utilizatorul nu a lasat o nota sau o recenzie.';
        RETURN v_rezultat;
        
    WHEN username_sau_film_invalid THEN
        v_rezultat := 'Username sau film invalid.';
        RETURN v_rezultat;
        
    WHEN username_sau_film_inexistent THEN
        v_rezultat := 'Username sau film inexistent.';
        RETURN v_rezultat;
        
    WHEN too_many_rows THEN
        v_rezultat := 'Utilizatorul a lasat mai multe recenzii pentru acelasi film.';
        RETURN v_rezultat;
        
    WHEN OTHERS THEN
        v_rezultat := 'Eroare neobisnuita.';
        RETURN v_rezultat;
END Recenzii_note;
/
DECLARE
    v_rezultat VARCHAR2(1000);
BEGIN
    DBMS_OUTPUT.PUT_LINE(Recenzii_Note(NULL, 'Un Film', v_rezultat));
END;
/
DECLARE
    v_rezultat VARCHAR2(1000);
BEGIN
    DBMS_OUTPUT.PUT_LINE(Recenzii_Note('utilizator_inexistent', 'film_inexistent', v_rezultat));
END;
/
DECLARE
    v_rezultat VARCHAR2(1000);
BEGIN
    DBMS_OUTPUT.PUT_LINE(Recenzii_NOTE('numauitlafilme', 'Kill Bill: Vol. 1', v_rezultat));
END;
/
DECLARE 
    v_rezultat VARCHAR2(1000);
BEGIN
    DBMS_OUTPUT.PUT_LINE(Recenzii_NOTE('numauitlafilme', 'Schindler`s List', v_rezultat));
END;
/
DECLARE
    v_rezultat VARCHAR2(1000);
BEGIN
    DBMS_OUTPUT.PUT_LINE(Recenzii_NOTE('numauitlafilme', 'Schindler`s List', v_rezultat));
    --valoarea temporara a fost stearsa, acum ar trebui sa afiseze recenzia si nota.
END;
/

--am inserat o valoare temporara, intrucat fiecare utilizator avea si nota si recenzie
insert into Recenzii values (81, 1, 4, 'Nemaipomenit.');
select * from Recenzii;
select * from Utilizatori;
Delete from Recenzii where recenzie like 'Nemaipomenit.';

--am inserat o valoare temporara, intrucat fiecare utilizator avea o singura recenzie la un film
Insert into Recenzii values(81, 1, 1, 'Tare.');
Delete from Recenzii where recenzie like 'Tare.';

-------------------------------------------------------------------------------------------------

--Exercitiul 9. Formula?i în limbaj natural o problem? pe care s? o rezolva?i folosind un subprogram stocat
-- independent de tip procedur? care s? aib? minim 2 parametri ?i s? utilizeze într-o singur?
-- comand? SQL 5 dintre tabelele create. Defini?i minim 2 excep?ii proprii, altele decât cele
-- predefinite la nivel de sistem. Apela?i subprogramul astfel încât s? eviden?ia?i toate cazurile definite
-- ?i tratate

-- procedura care primeste ca parametri un username, un gen de film
-- si o tara si returneaza filmele din acel gen pe care utilizatorul le are in lista
-- regizate de regizori din acea tara

CREATE OR REPLACE PROCEDURE Filme_Vizionate_De_Utilizator(
    p_username IN Utilizatori.username%TYPE,
    p_gen IN Genuri.gen%TYPE,
    p_tara IN Tari.nume%TYPE,
    p_filme OUT VARCHAR2
) IS
    utilizator_inexistent EXCEPTION;
    gen_inexistent EXCEPTION;
    filme_inexistente EXCEPTION;
    rezultat VARCHAR2(1000) := '';
    numar_utilizatori NUMBER;
    numar_genuri NUMBER;
    numar_filme NUMBER := 0; 
    CURSOR filme_cursor IS
        SELECT f.titlu
        FROM Utilizatori u
        JOIN Liste_Filme lf ON u.id_utilizator = lf.id_utilizator
        JOIN Filme_Liste_Filme flf ON lf.id_lista_filme = flf.id_lista_filme 
        JOIN Filme f ON flf.id_film = f.id_film
        JOIN Regizori r ON f.id_regizor = r.id_regizor
        JOIN Tari t ON r.id_tara = t.id_tara
        JOIN Filme_Genuri fg ON f.id_film = fg.id_film
        JOIN Genuri g ON fg.id_gen = g.id_gen
        WHERE u.username = p_username AND g.gen = p_gen AND t.nume = p_tara;
BEGIN
    -- Verificare existenta utilizator
    SELECT COUNT(*)
    INTO numar_utilizatori
    FROM Utilizatori
    WHERE username = p_username;

    IF numar_utilizatori = 0 THEN
        RAISE utilizator_inexistent;
    END IF;

    -- Verificare existenta gen
    SELECT COUNT(*)
    INTO numar_genuri
    FROM Genuri
    WHERE gen = p_gen;

    IF numar_genuri = 0 THEN
        RAISE gen_inexistent;
    END IF;

    FOR film_rec IN filme_cursor LOOP
        numar_filme := numar_filme + 1; 
        IF rezultat IS NOT NULL THEN
            rezultat := rezultat || ', ';
        END IF;
        rezultat := rezultat || film_rec.titlu;
    END LOOP;

    IF numar_filme = 0 THEN
        RAISE filme_inexistente;
    END IF;

    p_filme := 'Filme vizionate: ' || rezultat;

EXCEPTION
    WHEN utilizator_inexistent THEN
        p_filme := 'Utilizatorul nu a fost gasit.';
    WHEN gen_inexistent THEN
        p_filme := 'Genul specificat nu a fost gasit.';
    WHEN filme_inexistente THEN
        p_filme := 'Utilizatorul nu a vizionat filme din acest gen regizate de regizori din tara specificata.';
    WHEN OTHERS THEN
        p_filme := 'Eroare necunoscuta.';
END Filme_Vizionate_De_Utilizator;
/
DECLARE
    v_filme VARCHAR2(1000);
BEGIN
    Filme_Vizionate_De_Utilizator('utilizator_inexistent', 'Comedie', 'Romania', v_filme);
    DBMS_OUTPUT.PUT_LINE(v_filme);
END;
/
DECLARE
    v_filme VARCHAR2(1000);
BEGIN
    Filme_Vizionate_De_Utilizator('numauitlafilme', 'Gen_Inexistent', 'Romania', v_filme);
    DBMS_OUTPUT.PUT_LINE(v_filme);
END;
/
DECLARE
    v_filme VARCHAR2(1000);
BEGIN
    Filme_Vizionate_De_Utilizator('numauitlafilme', 'Comedie', 'Japonia', v_filme);
    DBMS_OUTPUT.PUT_LINE(v_filme);
END;
/
DECLARE
    v_filme VARCHAR2(1000);
BEGIN
    Filme_Vizionate_De_Utilizator('aniakkk', 'Comedie', 'Japonia', v_filme);
    DBMS_OUTPUT.PUT_LINE(v_filme);
END;
/

---------------------------------------------------------------------------------------

-- Exercitiul 13. Formula?i în limbaj natural o problem? pe care s? o rezolva?i folosind un pachet care s? includ?
-- tipuri de date complexe ?i obiecte necesare unui flux de ac?iuni integrate, specifice bazei de date
-- definite (minim 2 tipuri de date, minim 2 func?ii, minim 2 proceduri). 

select * from Utilizatori;

-- Un pachet care sa faca platforma Letterboxd cat 
-- mai user-friendly si sa faciliteze folosirea sa.

CREATE OR REPLACE PACKAGE Letterboxd_User AS
    TYPE Utilizatori_Rec IS RECORD (
        username VARCHAR2(100),
        nume VARCHAR2(50),
        prenume VARCHAR2(50),
        email VARCHAR2(100),
        id_tara Tari.id_tara%TYPE, 
        biografie VARCHAR2(100)
    );
    -- date despre utilizatori

    TYPE Platforma_Rec IS RECORD (
        nume VARCHAR2(50),
        cost_lunar NUMBER
    );
    -- date despre platforma

    TYPE Utilizatori_Tabel IS TABLE OF Utilizatori_Rec INDEX BY PLS_INTEGER;
    TYPE Platforme_Tabel IS TABLE OF Platforma_Rec INDEX BY PLS_INTEGER;

    FUNCTION Afiseaza_Utilizatori_din_Tara(p_tara Tari.id_tara%TYPE) RETURN Utilizatori_Tabel;
    FUNCTION Afiseaza_Platforme_Sub_Pret(p_pret_max NUMBER) RETURN Platforme_Tabel;

    PROCEDURE Adauga_Utilizator(p_utilizator Utilizatori_Rec, p_varsta NUMBER);
    PROCEDURE Modifica_Cost_Platforma(p_nume_platforma VARCHAR2, p_nou_cost NUMBER);
    
END Letterboxd_User;
/

CREATE OR REPLACE PACKAGE BODY Letterboxd_User AS
    FUNCTION Afiseaza_Utilizatori_din_Tara(p_tara Tari.id_tara%TYPE) RETURN Utilizatori_Tabel IS
        v_utilizatori Utilizatori_Tabel;
        v_index PLS_INTEGER := 0;
    BEGIN
        FOR rec IN (SELECT username, email, id_tara, nume, prenume, biografie 
                    FROM Utilizatori 
                    WHERE id_tara = p_tara) LOOP
            v_index := v_index + 1; 
            v_utilizatori(v_index).username := rec.username;
            v_utilizatori(v_index).email := rec.email;
            v_utilizatori(v_index).nume := rec.nume;
            v_utilizatori(v_index).prenume := rec.prenume;
            v_utilizatori(v_index).id_tara := rec.id_tara; 
            v_utilizatori(v_index).biografie := rec.biografie;
        END LOOP;
        RETURN v_utilizatori;
    END Afiseaza_Utilizatori_din_Tara;

    FUNCTION Afiseaza_Platforme_Sub_Pret(p_pret_max NUMBER) RETURN Platforme_Tabel IS
        v_platforme Platforme_Tabel;
        v_index PLS_INTEGER := 0;
    BEGIN
        FOR rec IN (SELECT nume, cost_lunar FROM Platforme WHERE cost_lunar <= p_pret_max) LOOP
            v_index := v_index + 1; 
            v_platforme(v_index).nume := rec.nume;
            v_platforme(v_index).cost_lunar := rec.cost_lunar; 
        END LOOP;
        RETURN v_platforme;
    END Afiseaza_Platforme_Sub_Pret;

    PROCEDURE Adauga_Utilizator(p_utilizator Utilizatori_Rec, p_varsta NUMBER) IS
        utilizator_minor EXCEPTION;
        utilizator_existent EXCEPTION;
        tara_nu_exista_pe_platforma EXCEPTION;
        v_max_id NUMBER;

        FUNCTION EsteMinor(p_varsta NUMBER) RETURN BOOLEAN IS
        BEGIN
            RETURN p_varsta < 18;
        END EsteMinor;

        FUNCTION ExistaUtilizator(p_username VARCHAR2) RETURN BOOLEAN IS
            v_count NUMBER;   
        BEGIN
            SELECT COUNT(*)
            INTO v_count
            FROM Utilizatori
            WHERE username = p_username;
            
            RETURN v_count > 0;
        END ExistaUtilizator;

        FUNCTION ExistaTara(p_tara NUMBER) RETURN BOOLEAN IS
            v_count NUMBER;
        BEGIN
            SELECT COUNT(*)
            INTO v_count
            FROM Tari
            WHERE id_tara = p_tara;
            
            RETURN v_count > 0;
        END ExistaTara;

    BEGIN
        IF EsteMinor(p_varsta) THEN
            RAISE utilizator_minor;
        END IF;
        
        IF ExistaUtilizator(p_utilizator.username) THEN
            RAISE utilizator_existent;
        END IF;
        
        IF NOT ExistaTara(p_utilizator.id_tara) THEN
            RAISE tara_nu_exista_pe_platforma;
        END IF;
        
        SELECT NVL(MAX(id_utilizator), 0) + 1 INTO v_max_id FROM Utilizatori;
        
        INSERT INTO Utilizatori
        VALUES (v_max_id, p_utilizator.id_tara, p_utilizator.username, p_utilizator.email, p_utilizator.nume, p_utilizator.prenume, p_utilizator.biografie, sysdate);
        
    EXCEPTION
        WHEN utilizator_minor THEN
            DBMS_OUTPUT.PUT_LINE('Utilizatorul este minor.');
        WHEN utilizator_existent THEN
            DBMS_OUTPUT.PUT_LINE('Exista deja un utilizator cu acest nume.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Eroare necunoscuta: ' || SQLERRM);
    END Adauga_Utilizator;

    PROCEDURE Modifica_Cost_Platforma(p_nume_platforma VARCHAR2, p_nou_cost NUMBER) IS
    BEGIN
        UPDATE Platforme
        SET cost_lunar = p_nou_cost
        WHERE nume = p_nume_platforma;

        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Platforma cu numele ' || p_nume_platforma || ' nu a fost gasita.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Costul lunar al platformei ' || p_nume_platforma || ' a fost actualizat la ' || p_nou_cost);
        END IF;
    END Modifica_Cost_Platforma;

END Letterboxd_User;
/

DECLARE
    v_utilizator Letterboxd_User.Utilizatori_Rec;
BEGIN
    v_utilizator.username := 'utilizator_unu';
    v_utilizator.nume := 'Utilizator';
    v_utilizator.prenume := 'Unu';
    v_utilizator.email := 'utilizator.unu@yahoo.com';
    v_utilizator.id_tara := 1; 
    v_utilizator.biografie := 'Un utilizator pasionat de filme.';

    Letterboxd_User.Adauga_Utilizator(v_utilizator, 25); 
END;
/
    
select * from Utilizatori;

delete from Utilizatori
where id_utilizator = 26;


DECLARE
    v_utilizatori Letterboxd_User.Utilizatori_Tabel;
    v_tara NUMBER := 1; 
    v_index PLS_INTEGER;
BEGIN
    v_utilizatori := Letterboxd_User.Afiseaza_Utilizatori_din_Tara(v_tara);

    v_index := v_utilizatori.FIRST;
    WHILE v_index IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE('Username: ' || v_utilizatori(v_index).username || 
                             ', Nume: ' || v_utilizatori(v_index).nume || 
                             ', Prenume: ' || v_utilizatori(v_index).prenume);
        v_index := v_utilizatori.NEXT(v_index);
    END LOOP;
END;
/
  
DECLARE
    v_platforme Letterboxd_User.Platforme_Tabel;
    v_pret_max NUMBER := 10; 
    v_index PLS_INTEGER;
BEGIN
    v_platforme := Letterboxd_User.Afiseaza_Platforme_Sub_Pret(v_pret_max);

    v_index := v_platforme.FIRST;
    WHILE v_index IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE('Platforma: ' || v_platforme(v_index).nume || 
                             ', Cost lunar: ' || v_platforme(v_index).cost_lunar);
        v_index := v_platforme.NEXT(v_index);
    END LOOP;
END;
/

BEGIN
    Letterboxd_User.Modifica_Cost_Platforma('Netflix', 12.99); 
END;
/

select * from platforme;  
    
    
    
    





  



