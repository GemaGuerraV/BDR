## Tarea #3
### Universidad de Ciencias Físico Matemáticas
#### Maestría en Ciencia de Datos - Bases de Datos Relacionales

Esquema del modelo relacional de mi BD:

Titles (<ins>id_title</ins>, title_type, primaryTitle, originalTitle, IsAdult, startyear, endyear, runtimeMinutes, genres)<p>
Titles Characters (<ins>id_person</ins>, primaryName, birthYear, deathYear, primaryProfession, knownForTitles(id_title))<p>
Ratings (<ins>id_title</ins>, averageRating, numVotes)<p>
Title Principals (id_title, id_person, category, job, characters)<p>
Title Crew (id_title, directors (id_person), writers(id_person))<p>


Director (<ins>id_director</ins>, nombre, fecha_nacimiento)
Género (<ins>id_genero</ins>, nombre)
Usuario (<ins>id_usuario</ins>, nombre, email)
Reseña (<ins>id_reseña</ins>, id_usuario, id_película, calificacion, comentario, fecha)