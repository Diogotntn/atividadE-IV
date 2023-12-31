CREATE DATABASE Escola;
USE Escola;

CREATE TABLE Alunos(
ID_Aluno INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Data_nascimento Date NOT NULL,
Serie INT
);

INSERT INTO Alunos (Nome, Data_nascimento, Serie) 
VALUES ('Guilherme Almeida', '2002-10-20', 9);
INSERT INTO Alunos (Nome, Data_nascimento, Serie) 
VALUES ('João vitor', '2004-02-16', 8);
INSERT INTO Alunos (Nome, Data_nascimento, Serie) 
VALUES ('Bolota', '2005-02-18', 8);

CREATE TABLE Matriculas(
ID_Matricua INT AUTO_INCREMENT PRIMARY KEY,
Aluno_ID INT,
FOREIGN KEY (Aluno_ID) REFERENCES Alunos(ID_Aluno),
Data_matricula DATE NOT NULL,
Status VARCHAR(20) NOT NULL
);

INSERT INTO Matriculas (Aluno_ID, Data_matricula, Status) 
VALUES (1, '2024-02-02', 'Ativa');
INSERT INTO Matriculas (Aluno_ID, Data_matricula, Status) 
VALUES (2, '2024-02-03', 'Ativa');
INSERT INTO Matriculas (Aluno_ID, Data_matricula, Status) 
VALUES (3, '2024-03-04', 'Ativa');

DELIMITER //

CREATE TRIGGER verify_idade
BEFORE INSERT ON matriculas
FOR EACH ROW
BEGIN
    DECLARE idade_aluno INT;
    SELECT TIMESTAMPDIFF(YEAR, alunos.data_nascimento, CURDATE()) INTO idade_aluno
    FROM alunos
    WHERE ID_Aluno = NEW.Aluno_ID;
    IF NEW.Serie = 1 AND idade_aluno < 6 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Aluno não atende aos requisitos de idade para a série 1. Idade mínima: 6 anos.';
    ELSEIF NEW.Serie = 2 AND idade_aluno < 7 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Aluno não atende aos requisitos de idade para a série 2. Idade mínima: 7 anos.';
    END IF;
END;

//DELIMITER ;