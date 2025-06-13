## Tarea #3
### Universidad de Ciencias Físico Matemáticas
#### Maestría en Ciencia de Datos - Bases de Datos Relacionales

### <span style="color: green;">Esquema del modelo relacional</span><P>
Titles (<ins>id_title</ins>, title_type, primaryTitle, originalTitle, IsAdult, startyear, endyear, runtimeMinutes, genres, region, language, isOriginalTitle)<p>
- id_title (primary key)

Characters (<ins>id_person</ins>, TopTitles, primaryName, birthYear, deathYear, primaryProfession)<p>
- id_person (primary key)
- id_titles (foreign key)

Titles_Ratings (id_title, averageRating, numVotes)<p>
- id_title (foreign key)

Titles_Principals (id_title, id_person, category, job, characters)<p>
- id_title (foreign key)
- id_person (foreign key)
---
### <span style="color: green;">Diagrama relacional<P></span>

```mermaid
erDiagram
    TITLES |{--|| TITLES_RATINGS : Graded
    TITLES |{--|{ TITLES_PRINCIPALS : ProducedBy
    TITLES |{--|{ CHARACTERS : Have
    CHARACTERS ||--|{ TITLES_PRINCIPALS : LeadBy
   

    TITLES {
        string id_title 
        string title_type
        string primaryTitle
        string originalTitle
        boolean IsAdult
        integer startyear 
        integer endyear
        integer runtimeMinutes
        string genres
        string region
        string language
        string isOriginalTitle
    }

    CHARACTERS {
        string id_persona 
        string TopTitles
        string primaryName
        int birthYear 
        int deathYear
        string primaryProfession
    }

    TITLES_PRINCIPALS {
        string id_persona 
        string id_title 
        int category
        int job 
        int characters
    }

    TITLES_RATINGS {
        string id_title 
        decimal averageRating
        integer numVotes
    }
````
---

### <span style="color: green;">Operaciones Algebráicas de interés<P></span>

#### Expresión Algebráica #1: <span style="color: orange;">π id_title(σ averageRating > 8.5(TITLES_RATINGS))</span>

*Descripción:* Muestra los ID's de los títulos en donde el rating promedio es mayor a 8.5.<br>
<br>

#### Expresión Algebráica #2: <span style="color: orange;"> π primaryName(π id_persona(σ category = director(TITLES_PRINCIPALS))(CHARACTERS))</span>

*Descripción:* Muestra únicamente los nombres de las personas que son directores de películas.<br>
<br>

#### Expresión Algebráica #3: <span style="color: orange;"> TP_P=TITLES_PRINCIPALS ∪ TITLES, Age=startyear-birthyear, π id_personas (σ Age<50(TP_P))</span>

*Descripción:* Muestra el ID de las personas con una edad de menos de 50 años que fueron directores, productores o escritores.<br>
<br>

#### Expresión Algebráica #4: <span style="color: orange;"> TITLES × CHARACTERS - π id_title(σ id_persona (TITLES_PRINCIPALS)) </span>

*Descripción:* Se tiene todas las combinaciones de las películas y de las personas (productores/actores) y al restarse los ID's de las películas de la tabla de productores se pbtiene una proyección de los ID's de personas que no son directores, escritores ni productores; en otras palabras se obtienen los ID's de los actores únicamente.<br>
<br>