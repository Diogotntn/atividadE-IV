CREATE DATABASE RH;
USE RH;

CREATE TABLE Funcionarios(
ID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Data_admissao DATE,
Data_atual DATE 
);

INSERT INTO Funcionarios (Nome, DataAdmissao, DataAtual) 
VALUES ('Ingrid Almeida', '2024-05-12', '2023-12-25');
INSERT INTO Funcionarios (Nome, DataAdmissao, DataAtual) 
VALUES ('Maria Damasceno', '2024-05-12', '2023-12-25');

DELIMITER //
CREATE TRIGGER verify_data
BEFORE INSERT ON Funcionarios
FOR EACH ROW
BEGIN
    IF NEW.Data_admissao <= CURDATE() THEN
        SIGNAL SQLSTATE '55000'
        SET MESSAGE_TEXT = 'A data de admissão tem que ser maior que a data atual.';
    END IF;
END;
//
DELIMITER ;

SELECT * FROM Funcionarios;