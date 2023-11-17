CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Livro(
ID_Livro INT AUTO_INCREMENT PRIMARY KEY,
Titulo VARCHAR(255) NOT NULL,
Autor VARCHAR(255) NOT NULL,
Quantidade_estoque INT NOT NULL
);

INSERT INTO Livro (Titulo, Autor, Quantidade_estoque) 
VALUES ('God of war', 'Kratos', 14);
INSERT INTO Livro (Titulo, Autor, Quantidade_estoque) 
VALUES ('Os segredos da mente milionária', 'T. Harv Eker', 50);

CREATE TABLE Emprestimo(
ID_Emprestimo INT AUTO_INCREMENT PRIMARY KEY,
ID_Livro INT,
FOREIGN KEY (LivroID) REFERENCES Livro (ID_Livro),
Data_Emprestimo DATETIME,
Data_devolucao DATETIME 
);

INSERT INTO Emprestimo (ID_Livro, Data_Emprestimo, Data_devolucao) 
VALUES (2, '2025-03-02 12:00:00', '2023-02-04 12:00:01');
INSERT INTO Emprestimo (ID_Livro, Data_Emprestimo, Data_devolucao) 
VALUES (2, '2026-03-05 12:00:02', '2026-03-005 12:00:03');


DELIMITER //

CREATE TRIGGER att_estoque
AFTER INSERT ON Emprestimo
FOR EACH ROW
	BEGIN
	UPDATE Livro
	SET QntdE = QntdE -1
	WHERE IdLivro = NEW.LivroId;
END;

// DELIMITER ;

SELECT * FROM Livro;