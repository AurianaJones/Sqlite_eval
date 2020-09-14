--Je creer ma table contenant les étudiants compris dans le tableau d'origine
CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR
);

INSERT INTO students (name)
VALUES ("Fatima"), ("Deborah"), ("Maxim"), ("Steeven"), ("Camille"), ("Jojo"), ("Pierre"), ("Clement"),("Chloé"),("Lucas"),("Isa"),("Julie"),("Voja");

--Je creer ma table contenant les couleurs representant le niveau estimé de l'étudiant par compétence
CREATE TABLE IF NOT EXISTS colors(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR
);

INSERT INTO colors(name)
VALUES('Vert'),('Bleu'),('Violet');

DROP TABLE colors;

--Je creer la table des competance 
CREATE TABLE IF NOT EXISTS comp(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR
);
INSERT INTO comp(name)
VALUES('C1'),('C2'),('C3');

--Maintenant la 1er table de jointure faisant la connection entre les competances et les couleurs

CREATE TABLE IF NOT EXISTS level_comp(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    comp_id INTEGER,
    colors_id INTEGER,
    FOREIGN KEY(comp_id) REFERENCES comp(id),
    FOREIGN KEY(colors_id) REFERENCES colors(id)
)


INSERT INTO level_comp(comp_id,colors_id)
VALUES (1,1), (1,2), (1,3), (2,1), (2,2), (2,3), (3,1), (3,2), (3,3);

--Maintenant la dernière table faisant le lien entre les etudiant et les diferents niveaux

CREATE TABLE IF NOT EXISTS students_level(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    level_comp_id INTEGER,
    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(level_comp_id) REFERENCES level_comp(id)
)
