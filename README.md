# Letterboxd-style Relational Database (Oracle SQL & PL/SQL)

A relational database for a film-review platform inspired by [Letterboxd](https://letterboxd.com). The project goes from a **conceptual model** to a **normalized Oracle schema**, with realistic seed data and a **PL/SQL layer** of stored procedures, functions, triggers and a package that enforce business rules inside the database.

Built for the database courses of the BSc in Computer Science, University of Bucharest.

![Oracle](https://img.shields.io/badge/Oracle_Database-F80000?logo=oracle&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1)
![PL/SQL](https://img.shields.io/badge/PL%2FSQL-F80000?logo=oracle&logoColor=white)

---

## Data model

![Conceptual diagram](Diagrama%20Conceptuala.png)

**12 tables**: 8 entity tables and 4 junction tables for the many-to-many relationships.

| Table | Description | Key constraints |
|---|---|---|
| `Tari` | Countries | `UNIQUE(nume)` |
| `Regizori` | Directors | FK → `Tari` |
| `Utilizatori` | Users | FK → `Tari` |
| `Filme` | Films (title, year, runtime, language, description `CLOB`) | FK → `Regizori` |
| `Genuri` | Genres | |
| `Platforme` | Streaming platforms with monthly cost | |
| `Note` | Ratings | composite PK `(user, film)`, `CHECK (nota BETWEEN 1 AND 10)` |
| `Recenzii` | Written reviews (`CLOB`) | FK → `Utilizatori`, `Filme` |
| `Liste_Filme` | User film lists | `CHECK (securitate IN ('PRIVAT','PUBLIC'))` |
| `Filme_Genuri` | Film ↔ Genre | composite PK |
| `Filme_Platforme` | Film ↔ Platform | composite PK |
| `Filme_Liste_Filme` | Film ↔ List | composite PK |

Design choices:
- The schema is normalized to **3NF**: countries, genres and platforms are separate dimension-like tables instead of repeated text.
- A rating (`Note`) and a review (`Recenzii`) are **separate facts**. A user can rate a film without reviewing it, which is the same as on Letterboxd.
- Data rules are enforced in the schema itself with `NOT NULL`, `CHECK`, `UNIQUE` and foreign keys, not only in application code.

### Seed data

511 `INSERT` statements with realistic data:
- **40 films** by **21 directors** from **11 countries** (Spielberg, Tarantino, Truffaut, Fellini, Kurosawa, Bergman, Mungiu, …)
- 25 users, 15 genres, 6 platforms
- 80 ratings, 80 reviews, 80 film-platform links, 78 film-genre links and 50 film-list entries

## PL/SQL layer

| Object | Type | What it does | Techniques used |
|---|---|---|---|
| `filme_dupa_platforma_si_nota` | Procedure | Films available on a given platform whose average rating is above a threshold, with director and average | All 3 collection types (associative array, nested table, `VARRAY`), cursor loop, `GROUP BY … HAVING AVG()` over 5 joined tables |
| `film_cu_utilizatori` | Procedure | All users who saved a given film in one of their lists | Two cursors, one **parameterized** and driven by the other; custom errors via `RAISE_APPLICATION_ERROR` |
| `Recenzii_Note` | Function | Returns a user's review and rating for a film, only when both exist | Single SQL over 4 tables; handles `NO_DATA_FOUND`, `TOO_MANY_ROWS` and invalid input |
| `Filme_Vizionate_De_Utilizator` | Procedure | Films in a user's lists for a given genre, directed by someone from a given country | One query joining 5+ tables, **user-defined exceptions** |
| `stergere_filme` | DML trigger (statement-level) | Blocks deleting films that still have reviews | Referential protection beyond foreign keys |
| `adauga_regizor` | DML trigger (row-level) | Validates new directors: country exists, name is unique, minimum age | Local helper functions inside the trigger, 3 distinct error codes |
| `log_modificari_structura` | DDL trigger | Audits every `CREATE` / `ALTER` / `DROP` on the schema into `Modificari_Structura` | `AFTER … ON SCHEMA`, event attribute functions |
| `Letterboxd_User` | Package | User and platform management API: users by country, platforms under a price, add user (with age check), update platform cost | `RECORD` types, associative arrays of records returned from functions, specification and body kept separate |

## How to run

Works on any Oracle Database 19c+ instance, including the free **Oracle Database 23ai Free** (Docker) or **Oracle Live SQL**.

```bash
# Example with Docker
docker run -d --name oracle -p 1521:1521 -e ORACLE_PASSWORD=pass gvenzl/oracle-free
```

Then run the scripts in this order (SQL Developer, SQLcl or Live SQL):

1. `Tables.sql`: creates the 12 tables
2. `Inserts.sql`: loads the seed data
3. `Exercitii.sql`: creates the PL/SQL objects and calls each one with test cases, including the error cases

`233_Iordache_TudorDimitrie_sursa.txt` contains the full script (DDL, data and PL/SQL) in one file. The `.docx` is the project report, in Romanian.

## Example query

Average rating per film on a given platform, above a threshold:

```sql
SELECT f.titlu, r.nume AS regizor, ROUND(AVG(n.nota), 2) AS nota_medie
FROM Filme f
JOIN Note n             ON n.id_film = f.id_film
JOIN Regizori r         ON r.id_regizor = f.id_regizor
JOIN Filme_Platforme fp ON fp.id_film = f.id_film
JOIN Platforme p        ON p.id_platforma = fp.id_platforma
WHERE p.nume = 'Netflix'
GROUP BY f.titlu, r.nume
HAVING AVG(n.nota) > 7
ORDER BY nota_medie DESC;
```

> Table and column names are in Romanian (e.g. `Filme` = films, `Note` = ratings, `Recenzii` = reviews, `Regizori` = directors, `Tari` = countries).
