-- Crearea tabelei Tari

Create table Tari
(
  id_tara NUMBER NOT NULL,
  nume varchar2(30) NOT NULL UNIQUE,
  primary key(id_tara)
);

Describe Tari;

-------------------------

-- Crearea tabelei Regizori

Create table Regizori
(
    id_regizor NUMBER NOT NULL,
    id_tara NUMBER NOT NULL,
    nume varchar2(30) NOT NULL,
    prenume varchar2(30) NOT NULL,
    data_nasterii date NOT NULL,
    primary key(id_regizor),
    foreign key(id_tara) references Tari(id_tara)
);

Describe Regizori;

-------------------------

-- Crearea tabelei Utilizatori

Create table Utilizatori
(
    id_utilizator NUMBER NOT NULL,
    id_tara NUMBER NOT NULL,
    username varchar2(50) NOT NULL,
    email varchar2(50) NOT NULL,
    nume varchar2(30) NOT NULL,
    prenume varchar2(30) NOT NULL,
    biografie varchar2(100) NOT NULL,
    data_inregistrare DATE NOT NULL,
    primary key(id_utilizator),
    foreign key(id_tara) references Tari(id_tara)
);

Describe Utilizatori;

-------------------------

-- Crearea tabelei Filme

Create table Filme
(
    id_film NUMBER NOT NULL,
    id_regizor NUMBER NOT NULL,
    titlu varchar2(80) NOT NULL,
    an_lansare DATE NOT NULL,
    durata_minute NUMBER NOT NULL,
    limba varchar2(30) NOT NULL,
    descriere CLOB,
    primary key(id_film),
    foreign key(id_regizor) references Regizori(id_regizor)
);

Describe Filme;

-------------------------

-- Crearea tabelei Note

Create table Note
(
    id_utilizator NUMBER NOT NULL,
    id_film NUMBER NOT NULL,
    nota NUMBER NOT NULL CHECK(nota >= 1 AND nota <=10),
    primary key(id_utilizator, id_film),
    foreign key(id_utilizator) references Utilizatori(id_utilizator),
    foreign key(id_film) references Filme(id_film)
);

Describe Note;

-------------------------

-- Crearea tabelei Genuri

Create table Genuri
(
    id_gen NUMBER NOT NULL,
    gen varchar2(50) NOT NULL,
    primary key(id_gen)
);

Describe Genuri;

-------------------------

-- Crearea tabelei asociative Filme_Genuri dintre Filme si Genuri

Create table Filme_Genuri
(
    id_film NUMBER NOT NULL,
    id_gen NUMBER NOT NULL,
    primary key(id_film, id_gen),
    foreign key(id_film) references Filme(id_film),
    foreign key(id_gen) references Genuri(id_gen)  
);

Describe Filme_Genuri;

-------------------------

-- Crearea tabelei Liste_Filme

Create table Liste_Filme
(
    id_lista_filme NUMBER NOT NULL,
    id_utilizator NUMBER NOT NULL,
    securitate varchar2(50) CHECK(upper(securitate) in('PRIVAT', 'PUBLIC')),
    primary key(id_lista_filme),
    foreign key(id_utilizator) references Utilizatori(id_utilizator)
);

Describe Liste_Filme;

-------------------------

-- Crearea tabelei asociative Filme_Liste_Filme dintre Filme si Liste_Filme

Create table Filme_Liste_Filme
(
    id_film NUMBER NOT NULL,
    id_lista_filme NUMBER NOT NULL,
    primary key(id_film, id_lista_filme),
    foreign key(id_film) references Filme(id_film),
    foreign key(id_lista_filme) references Liste_Filme(id_lista_filme)
);

Describe Filme_Liste_Filme;

-------------------------

-- Crearea tabelei Recenzii

Create table Recenzii
(
    id_recenzie NUMBER NOT NULL,
    id_utilizator NUMBER NOT NULL,
    id_film NUMBER NOT NULL,
    recenzie CLOB,
    primary key(id_recenzie, id_utilizator, id_film),
    foreign key(id_utilizator) references Utilizatori(id_utilizator),
    foreign key(id_film) references Filme(id_film)
);

Describe Recenzii;

-------------------------

Create table Platforme
(
    id_platforma NUMBER NOT NULL,
    nume varchar2(50) NOT NULL,
    cost_lunar NUMBER NOT NULL,
    primary key(id_platforma)
);

Describe Platforme;

-------------------------

-- Crearea tabelei asociative Filme_Platforme dintre Filme si Platforme

Create table Filme_Platforme
(
    id_film NUMBER NOT NULL,
    id_platforma NUMBER NOT NULL,
    primary key(id_film, id_platforma),
    foreign key(id_film) references Filme(id_film),
    foreign key(id_platforma) references Platforme(id_platforma)
);

Describe Filme_Platforme;

--------------------------









