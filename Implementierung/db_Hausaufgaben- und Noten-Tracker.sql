CREATE DATABASE HausaufgabenApp;
GO
USE HausaufgabenApp;

-- Falls vorhanden, alte Tabellen löschen
IF OBJECT_ID('Note') IS NOT NULL DROP TABLE Note;
IF OBJECT_ID('Hausaufgabe') IS NOT NULL DROP TABLE Hausaufgabe;
IF OBJECT_ID('Fach') IS NOT NULL DROP TABLE Fach;
IF OBJECT_ID('Schueler') IS NOT NULL DROP TABLE Schueler;

-- Tabellen anlegen
CREATE TABLE Schueler (
    SchuelerID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100),
    Klasse NVARCHAR(10)
);

CREATE TABLE Fach (
    FachID INT PRIMARY KEY IDENTITY,
    Bezeichnung NVARCHAR(50)
);

CREATE TABLE Hausaufgabe (
    AufgabeID INT PRIMARY KEY IDENTITY,
    Titel NVARCHAR(100),
    Beschreibung NVARCHAR(255),
    Faelligkeit DATE,
    FachID INT FOREIGN KEY REFERENCES Fach(FachID),
    SchuelerID INT FOREIGN KEY REFERENCES Schueler(SchuelerID)
);

CREATE TABLE Note (
    NoteID INT PRIMARY KEY IDENTITY,
    FachID INT FOREIGN KEY REFERENCES Fach(FachID),
    SchuelerID INT FOREIGN KEY REFERENCES Schueler(SchuelerID),
    NoteWert DECIMAL(3,1),
    Datum DATE
);

-- Beispiel-Datensätze
INSERT INTO Schueler VALUES ('Max Mustermann', '10A'), ('Lisa Müller', '9B');
INSERT INTO Fach VALUES ('Mathematik'), ('Deutsch'), ('Englisch');
INSERT INTO Hausaufgabe VALUES 
('Bruchrechnen', 'Aufgabenblatt 3 bearbeiten', '2025-11-10', 1, 1),
('Aufsatz', '500 Wörter über Umweltschutz', '2025-11-12', 2, 1),
('Vokabeln lernen', 'Seite 32–33', '2025-11-13', 3, 2);
INSERT INTO Note VALUES 
(1, 1, 2.3, '2025-10-20'),
(2, 1, 1.7, '2025-09-25'),
(3, 2, 2.0, '2025-10-18');

-- Beispielausgabe mit JOIN
SELECT s.Name, f.Bezeichnung, n.NoteWert, h.Titel, h.Faelligkeit
FROM Schueler s
JOIN Note n ON s.SchuelerID = n.SchuelerID
JOIN Fach f ON n.FachID = f.FachID
JOIN Hausaufgabe h ON f.FachID = h.FachID;
