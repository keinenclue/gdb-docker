DROP TABLE IF EXISTS hoeren;
DROP TABLE IF EXISTS voraussetzen;
DROP TABLE IF EXISTS pruefen;
DROP TABLE IF EXISTS Vorlesungen;
DROP TABLE IF EXISTS Studenten;
DROP TABLE IF EXISTS StudentenGF;
DROP TABLE IF EXISTS Assistenten;
DROP TABLE IF EXISTS Professoren;
DROP TABLE IF EXISTS ProfessorenF;

CREATE TABLE Studenten
       (MatrNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Semester       INTEGER);
        
CREATE TABLE StudentenGF
       (MatrNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Semester       INTEGER,
        Geschlecht     VARCHAR(30) NOT NULL,
        Fakultaet      Varchar(30) NOT NULL);
        
CREATE TABLE Professoren
       (PersNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Rang           CHAR(2) CHECK (Rang in ('C2', 'C3', 'C4')),
        Raum           INTEGER UNIQUE);

CREATE TABLE ProfessorenF
       (PersNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Rang           CHAR(2) CHECK (Rang in ('C2', 'C3', 'C4')),
        Raum           INTEGER UNIQUE,
        Fakultaet      Varchar(30) NOT NULL);

CREATE TABLE Assistenten
       (PersNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Fachgebiet     VARCHAR(30),
        Boss           INTEGER,
        FOREIGN KEY    (Boss) REFERENCES Professoren(PersNR));

CREATE TABLE Vorlesungen
       (VorlNr         INTEGER PRIMARY KEY,
        Titel          VARCHAR(30),
        SWS            INTEGER,
        gelesenVon     INTEGER REFERENCES Professoren);

CREATE TABLE hoeren
       (MatrNr         INTEGER REFERENCES Studenten ON DELETE CASCADE,
        VorlNr         INTEGER REFERENCES Vorlesungen ON DELETE CASCADE,
        PRIMARY KEY    (MatrNr, VorlNr));

CREATE TABLE voraussetzen
       (Vorgaenger     INTEGER REFERENCES Vorlesungen ON DELETE CASCADE,
        Nachfolger     INTEGER REFERENCES Vorlesungen ON DELETE NO ACTION,
        PRIMARY KEY    (Vorgaenger, Nachfolger));

CREATE TABLE pruefen
       (MatrNr         INTEGER REFERENCES Studenten ON DELETE CASCADE,
        VorlNr         INTEGER REFERENCES Vorlesungen,
        PersNr         INTEGER REFERENCES Professoren,
        Note           NUMERIC(2,1) CHECK (Note between 0.7 and 5.0),
        PRIMARY KEY    (MatrNr, VorlNr));


INSERT INTO Studenten(MatrNr, Name, Semester) 
VALUES (24002, 'Xenokrates', 18); 
 
INSERT INTO Studenten(MatrNr, Name, Semester) 
VALUES (25403, 'Jonas', 12); 
 
INSERT INTO Studenten(MatrNr, Name, Semester) 
VALUES (26120, 'Fichte', 10); 

INSERT INTO Studenten(MatrNr, Name, Semester) 
VALUES (26830, 'Aristoxenos', 8); 
 
INSERT INTO Studenten(MatrNr, Name, Semester) 
VALUES (27550, 'Schopenhauer', 6); 

INSERT INTO Studenten(MatrNr, Name, Semester) 
VALUES (28106, 'Carnap', 3); 
 
INSERT INTO Studenten(MatrNr, Name, Semester) 
VALUES (29120, 'Theophrastos', 2); 
 
INSERT INTO Studenten(MatrNr, Name, Semester) 
VALUES (29555, 'Feuerbach', 2); 
 

INSERT INTO StudentenGF(MatrNr, Name, Semester, Geschlecht, Fakultaet) 
VALUES (24002, 'Xenokrates', 18, 'M', 'Philosophie'); 
 
INSERT INTO StudentenGF(MatrNr, Name, Semester, Geschlecht, Fakultaet) 
VALUES (25403, 'Jonas', 12, 'W', 'Theologie'); 
 
INSERT INTO StudentenGF(MatrNr, Name, Semester, Geschlecht, Fakultaet) 
VALUES (26120, 'Fichte', 10, 'W', 'Philosophie'); 

INSERT INTO StudentenGF(MatrNr, Name, Semester, Geschlecht, Fakultaet) 
VALUES (26830, 'Aristoxenos', 8, 'M', 'Philosophie'); 
 
INSERT INTO StudentenGF(MatrNr, Name, Semester, Geschlecht, Fakultaet) 
VALUES (27550, 'Schopenhauer', 6, 'M', 'Philosophie'); 

INSERT INTO StudentenGF(MatrNr, Name, Semester, Geschlecht, Fakultaet) 
VALUES (28106, 'Carnap', 3, 'W', 'Physik'); 
 
INSERT INTO StudentenGF(MatrNr, Name, Semester, Geschlecht, Fakultaet) 
VALUES (29120, 'Theophrastos', 2, 'M', 'Physik'); 
 
INSERT INTO StudentenGF(MatrNr, Name, Semester, Geschlecht, Fakultaet) 
VALUES (29555, 'Feuerbach', 2, 'W', 'Theologie'); 


INSERT INTO Professoren(PersNr, Name, Rang, Raum) 
VALUES (2125, 'Sokrates', 'C4', 226); 

INSERT INTO Professoren(PersNr, Name, Rang, Raum) 
VALUES (2126, 'Russel', 'C4', 232);  
 
INSERT INTO Professoren(PersNr, Name, Rang, Raum) 
VALUES (2127, 'Kopernikus', 'C3', 310); 
 
INSERT INTO Professoren(PersNr, Name, Rang, Raum) 
VALUES (2133, 'Popper', 'C3', 052); 
 
INSERT INTO Professoren(PersNr, Name, Rang, Raum) 
VALUES (2134, 'Augustinus', 'C3', 309); 
 
INSERT INTO Professoren(PersNr, Name, Rang, Raum) 
VALUES (2136, 'Curie', 'C4', 036); 
 
INSERT INTO Professoren(PersNr, Name, Rang, Raum) 
VALUES (2137, 'Kant', 'C4', 007); 



INSERT INTO ProfessorenF(PersNr, Name, Rang, Raum, Fakultaet) 
VALUES (2125, 'Sokrates', 'C4', 226, 'Philosophie'); 

INSERT INTO ProfessorenF(PersNr, Name, Rang, Raum, Fakultaet) 
VALUES (2126, 'Russel', 'C4', 232, 'Philosophie');  
 
INSERT INTO ProfessorenF(PersNr, Name, Rang, Raum, Fakultaet) 
VALUES (2127, 'Kopernikus', 'C3', 310, 'Physik'); 
 
INSERT INTO ProfessorenF(PersNr, Name, Rang, Raum, Fakultaet) 
VALUES (2133, 'Popper', 'C3', 052, 'Philosophie'); 
 
INSERT INTO ProfessorenF(PersNr, Name, Rang, Raum, Fakultaet) 
VALUES (2134, 'Augustinus', 'C3', 309, 'Theologie'); 
 
INSERT INTO ProfessorenF(PersNr, Name, Rang, Raum, Fakultaet) 
VALUES (2136, 'Curie', 'C4', 036, 'Physik'); 
 
INSERT INTO ProfessorenF(PersNr, Name, Rang, Raum, Fakultaet) 
VALUES (2137, 'Kant', 'C4', 007, 'Philosophie'); 
 
 
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3002, 'Platon', 'Ideenlehre', 2125); 
 
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3003, 'Aristoteles', 'Syllogistik', 2125); 
 
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3004, 'Wittgenstein', 'Sprachtheorie', 2126); 
 
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3005, 'Rhetikus', 'Planetenbewegung', 2127); 
 
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3006, 'Newton', 'Keplersche Gesetze', 2127); 
 
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3007, 'Spinoza', 'Gott und Natur', 2134); 


 
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5001, 'Grundzuege', 4, 2137);

INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5041, 'Ethik', 4, 2125);
 
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5043, 'Erkenntnistheorie', 3, 2126);
 
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5049, 'Maeeutik', 2, 2125);
 
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (4052, 'Logik', 4, 2125);
 
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5052, 'Wissenschaftstheorie', 3, 2126); 
 
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5216, 'Bioethik', 2, 2126); 
 
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5259, 'Der Wiener Kreis', 2, 2133); 
 
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5022, 'Glaube und Wissen', 2, 2134); 
 
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (4630, 'Die 3 Kritiken', 4, 2137); 


 
 
INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (26120, 5001); 
 
INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (27550, 5001); 
 
INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (27550, 4052); 
 
INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (28106, 5041); 
 
INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (28106, 5052); 
 
INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (28106, 5216); 
 
INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (28106, 5259); 
 
INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (29120, 5001); 

INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (29120, 5041); 

INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (29120, 5049); 

INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (29555, 5022); 

INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (25403, 5022);  
 
INSERT INTO hoeren(MatrNr, VorlNr) 
VALUES (29555, 5001);  
 
 
 
INSERT INTO voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5001, 5041); 
 
INSERT INTO voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5001, 5043); 
 
INSERT INTO voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5001, 5049); 
 
INSERT INTO voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5041, 5216);  

INSERT INTO voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5043, 5052);  

INSERT INTO voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5041, 5052); 
 
INSERT INTO voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5052, 5259); 
 


INSERT INTO pruefen(MatrNr, VorlNr, PersNr, Note) 
VALUES (28106, 5001, 2126, 1.0);

INSERT INTO pruefen(MatrNr, VorlNr, PersNr, Note) 
VALUES (25403, 5041, 2125, 2.0);

INSERT INTO pruefen(MatrNr, VorlNr, PersNr, Note) 
VALUES (27550, 4630, 2137, 2.0);
