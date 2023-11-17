CREATE DATABASE Vendas;
USE Vendas;

CREATE TABLE Funcionarios(
ID_Funcionario INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL, 
Cargo VARCHAR(255) NOT NULL,
Salario DOUBLE NOT NULL
);

INSERT INTO Funcionarios (ID_Funcionario, Nome, Cargo, Salario) 
VALUES (1, 'celia', 'Vendedor', 1550.00);
INSERT INTO Funcionarios (ID_Funcionario, Nome, Cargo, Salario) 
VALUES (2, 'Agbaldo', 'Vendedor', 1550.00);
INSERT INTO Funcionarios (ID_Funcionario, Nome, Cargo, Salario) 
VALUES (3, 'Luis', 'Vendedor', 1550.00);
INSERT INTO Funcionarios (ID_Funcionario, Nome, Cargo, Salario) 
VALUES (4, 'Marcelo', 'Vendedor', 1320.00);
INSERT INTO Funcionarios (ID_Funcionario, Nome, Cargo, Salario) 
VALUES (5, 'Júlia', 'Vendedor', 1320.00);
    
 CREATE TABLE Vendas(
 ID_Venda INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
 Funcionario_ID INT NOT NULL,
FOREIGN KEY (Funcionario_ID) REFERENCES Funcionarios(ID_Funcionario),
 Data_venda DATE NOT NULL, 
 Valor_venda DOUBLE NOT NULL
 );

INSERT INTO Vendas (ID_Venda, Funcionario_ID, Data_venda, Valor_venda) 
VALUES (3, 1, '2026-11-10', 300.00);
INSERT INTO Vendas (ID_Venda, Funcionario_ID, Data_venda, Valor_venda)
 VALUES (2, 1, '2026-12-11', 250.00);
INSERT INTO Vendas (ID_Venda, Funcionario_ID, Data_venda, Valor_venda) 
VALUES (3, 2, '2026-10-22', 255.00);
INSERT INTO Vendas (ID_Venda, Funcionario_ID, Data_venda, Valor_venda) 
VALUES (4, 3, '2023-03-03', 200.00);
INSERT INTO Vendas (ID_Venda, Funcionario_ID, Data_venda, Valor_venda)
 VALUES (5, 4, '2023-04-04', 200.00);
    
    
CREATE VIEW relatorio_vendas AS
SELECT f.Nome AS nome_funcionario, COUNT(v.ID_Venda) AS numero_vendas, SUM(v.Valor_venda) AS valor_total_vendas
FROM Funcionarios f
LEFT JOIN Vendas v ON f.ID_Funcionario = v.Funcionario_ID
GROUP BY f.Nome;

SELECT * FROM relatorio_vendas;