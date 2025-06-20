CREATE DATABASE IF NOT EXISTS movies_db;
USE movies_db;

CREATE TABLE TITLES(
  id_title INT PRIMARY KEY AUTO_INCREMENT,
  title_type  VARCHAR(50) NOT NULL,
  primaryTitle VARCHAR(50) NOT NULL,
  originalTitle VARCHAR(50) NOT NULL,
  IsAdult BOOL NOT NULL,
  startyear INT,
  endyear INT,
  runtimeMinutes INT NOT NULL,
  genres VARCHAR(50) NOT NULL
);

INSERT INTO TITLES VALUES (NULL, 'short', 'Chinese Opium Den', 'Chinese Opium Den', 0, 1894, NULL, 1, 'Short');
INSERT INTO TITLES VALUES (NULL, 'short', 'Corbett and Courtney Before the Kinetograph', 'Corbett and Courtney Before the Kinetograph', 0, 1894, NULL, 1, 'Short');
INSERT INTO TITLES VALUES (NULL, 'short', 'Edison Kinetoscopic Record of a Sneeze', 'Edison Kinetoscopic Record of a Sneeze', 0, 1894, NULL, 1, 'Documentary');
INSERT INTO TITLES VALUES (NULL, 'movie', 'Miss Jerry', 'Miss Jerry', 0, 1894, NULL, 45, 'Romance');
INSERT INTO TITLES VALUES (NULL, 'short', 'Leaving the Factory', 'La sortie de l''usine Lumière à Lyon', 0, 1895, NULL, 1, 'Documentary,Short');
INSERT INTO TITLES VALUES (NULL, 'short', 'Akrobatishes Potpourri', 'Akrobatishes Potpourri', 0, 1895, NULL, 1, 'Documentary,Short');
INSERT INTO TITLES VALUES (NULL, 'short', 'The Arrival of a Train', 'L''arrivée d''un train à la Ciotat', 0, 1896, NULL, 1, 'Documentary,Short');
INSERT INTO TITLES VALUES (NULL, 'short', 'The Photographic Congress Arrives in Lyon', 'Le débarquement du congrès de photographie à Lyon', 0, 1895, NULL, 1, 'Documentary,Short');
INSERT INTO TITLES VALUES (NULL, 'short', 'The Waterer Watered', 'L''arroseur arrosé', 0, 1895, NULL, 1, 'Comedy,Short');
INSERT INTO TITLES VALUES (NULL, 'short', 'Around a Cabin', 'Autour d''une cabine', 0, 1894, NULL, 2, 'Animation,Comedy,Short');
INSERT INTO TITLES VALUES (NULL, 'short', 'Boat Leaving the Port', 'Barque sortant du port', 0, 1895, NULL, 1, 'Documentary,Short');
INSERT INTO TITLES VALUES (NULL, 'short', 'Italienischer Bauerntanz', 'Italienischer Bauerntanz', 0, 1895, NULL, 1, 'Documentary,Short');
INSERT INTO TITLES VALUES (NULL, 'short', 'Das boxende Känguruh', 'Das boxende Känguruh', 0, 1895, NULL, 1, 'Short,Sport');

select*from TITLES;



CREATE TABLE CHARACTERS(
  id_person INT PRIMARY KEY AUTO_INCREMENT,
  primaryName VARCHAR(50) NOT NULL,
  birthYear INT,
  deathYear INT,
  primaryProfession VARCHAR(50) NOT NULL
  );

INSERT INTO CHARACTERS VALUES (NULL, 'Fred Astaire', 1899, 1987, 'actor,miscellaneous,producer');
INSERT INTO CHARACTERS VALUES (NULL, 'Lauren Bacall', 1924, 2014, 'actress,soundtrack,archive_footage');
INSERT INTO CHARACTERS VALUES (NULL, 'Brigitte Bardot', 1934, NULL, 'actress,music_department,producer');
INSERT INTO CHARACTERS VALUES (NULL, 'John Belushi', 1949, 1982, 'actor,writer,music_department');
INSERT INTO CHARACTERS VALUES (NULL, 'Ingmar Bergman', 1918, 2007, 'writer,director,actor');
INSERT INTO CHARACTERS VALUES (NULL, 'Ingrid Bergman', 1915, 1982, 'actress,producer,soundtrack');
INSERT INTO CHARACTERS VALUES (NULL, 'Humphrey Bogart', 1899, 1957, 'actor,producer,miscellaneous');
INSERT INTO CHARACTERS VALUES (NULL, 'Marlon Brando', 1924, 2004, 'actor,director,writer');
INSERT INTO CHARACTERS VALUES (NULL, 'Richard Burton', 1925, 1984, 'actor,producer,director');
INSERT INTO CHARACTERS VALUES (NULL, 'James Cagney', 1899, 1986, 'actor,director,producer');
INSERT INTO CHARACTERS VALUES (NULL, 'Gary Cooper', 1901, 1961, 'actor,stunts,producer');
INSERT INTO CHARACTERS VALUES (NULL, 'Bette Davis', 1908, 1989, 'actress,make_up_department,producer');
INSERT INTO CHARACTERS VALUES (NULL, 'Doris Day', 1922, 2019, 'actress,producer,miscellaneous');
INSERT INTO CHARACTERS VALUES (NULL, 'Olivia de Havilland', 1916, 2020, 'actress,soundtrack,archive_footage');
INSERT INTO CHARACTERS VALUES (NULL, 'James Dean', 1931, 1955, 'actor,miscellaneous,archive_footage');

select*from CHARACTERS;


CREATE TABLE TITLES_RATINGS(
  id_title INT,
 	 FOREIGN KEY (id_title) REFERENCES TITLES(id_title),
  averageRating DECIMAL NOT NULL,
  numVotes INT NOT NULL
   );

INSERT INTO TITLES_RATINGS VALUES (1, 5.7, 2163);
INSERT INTO TITLES_RATINGS VALUES (2, 5.5, 296);
INSERT INTO TITLES_RATINGS VALUES (3, 6.5, 2214);
INSERT INTO TITLES_RATINGS VALUES (4, 5.3, 189);
INSERT INTO TITLES_RATINGS VALUES (5, 6.2, 2955);
INSERT INTO TITLES_RATINGS VALUES (6, 5.0, 213);
INSERT INTO TITLES_RATINGS VALUES (7, 5.3, 913);
INSERT INTO TITLES_RATINGS VALUES (8, 5.4, 2306);
INSERT INTO TITLES_RATINGS VALUES (9, 5.4, 225);
INSERT INTO TITLES_RATINGS VALUES (10, 6.8, 7987);
INSERT INTO TITLES_RATINGS VALUES (11, 5.2, 422);
INSERT INTO TITLES_RATINGS VALUES (12, 7.4, 13526);
INSERT INTO TITLES_RATINGS VALUES (13, 5.7, 2075);


select*from TITLES_RATINGS

CREATE TABLE TITLES_PRINCIPALS(
  id_person INT,
  FOREIGN KEY (id_person) REFERENCES CHARACTERS(id_person), 
  id_title INT,
  FOREIGN KEY (id_title) REFERENCES TITLES(id_title),
  category VARCHAR(50) NOT NULL,
  job VARCHAR(50),
  characters VARCHAR(100)
);

INSERT INTO TITLES_PRINCIPALS VALUES (1, 5, 'self', NULL, '[self]');
INSERT INTO TITLES_PRINCIPALS VALUES (1, 10, 'director', NULL, NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (1, 2, 'producer', 'producer', NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (1, 8, 'cinematographer', 'director of photography', NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (2, 1, 'director', NULL, NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (2, 12, 'composer', NULL, NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (3, 7, 'director', NULL, NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (3, 3, 'writer', NULL, NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (3, 9, 'producer', 'producer', NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (3, 6, 'producer', 'producer', NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (3, 11, 'composer', NULL, NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (3, 4, 'editor', 'editor', NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (4, 13, 'director', NULL, NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (4, 2, 'composer', NULL, NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (5, 8, 'actor', NULL, '[Blacksmith]');
INSERT INTO TITLES_PRINCIPALS VALUES (5, 5, 'actor', NULL, '[Assistant]');
INSERT INTO TITLES_PRINCIPALS VALUES (5, 10, 'producer', 'producer', NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (7, 1, 'actor', NULL, NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (7, 12, 'actor', NULL, NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (7, 7, 'director', NULL, NULL);
INSERT INTO TITLES_PRINCIPALS VALUES (7, 3, 'director', NULL, NULL);

select*from TITLES_PRINCIPALS;