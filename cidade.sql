CREATE DATABASE Relatorio_Pay;
USE Relatorio_Pay;

CREATE TABLE Clientes (
ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Endereco VARCHAR(255) NOT NULL,
Cidade VARCHAR(255) NOT NULL
);

INSERT INTO Clientes (ID_Cliente, Nome, Endereco, Cidade) 
VALUES (1, 'arivaldo', 'Rua jaime coelho', 'Salvador');
INSERT INTO Clientes (ID_Cliente, Nome, Endereco, Cidade) 
VALUES (2, 'genildo', 'Rua da gloria', 'Salvador');
INSERT INTO Clientes (ID_Cliente, Nome, Endereco, Cidade) 
VALUES (3, 'giosvaldo', 'Rua Barra do jaucipe', 'camaçari');
INSERT INTO Clientes (ID_Cliente, Nome, Endereco, Cidade) 
VALUES (4, 'vanclivison', 'vilas do atlantico', 'lauro de freitas');
INSERT INTO Clientes (ID_Cliente, Nome, Endereco, Cidade) 
VALUES (5, 'albuquerque', 'Rua das Flores', 'Jauá');

 CREATE TABLE Pagamentos (
ID_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
Cliente_ID INT NOT NULL,
FOREIGN KEY (Cliente_ID) REFERENCES Clientes(ID_Cliente),
Data_pagamento DATE NOT NULL,
Valor_pagamento DOUBLE NOT NULL
);

INSERT INTO Pagamentos (ID_Pagamento, Cliente_ID, Data_pagamento, Valor_pagamento)
VALUES (1, 1, '2025-04-09', 800.00);
INSERT INTO Pagamentos (ID_Pagamento, Cliente_ID, Data_pagamento, Valor_pagamento) 
VALUES (2, 1, '2026-05-10', 700.50);
INSERT INTO Pagamentos (ID_Pagamento, Cliente_ID, Data_pagamento, Valor_pagamento) 
VALUES (3, 2, '2027-06-11', 600.00);
INSERT INTO Pagamentos (ID_Pagamento, Cliente_ID, Data_pagamento, Valor_pagamento) 
VALUES (4, 3, '2028-07-12', 500.00);
INSERT INTO Pagamentos (ID_Pagamento, Cliente_ID, Data_pagamento, Valor_pagamento) 
VALUES (5, 4, '2029-08-13', 400.00); 
    
CREATE VIEW relatorios_pagamentos AS
SELECT c.Cidade AS nome_cidade, SUM(p.Valor_pagamento) AS valor_total_pagamentos
FROM Clientes c
LEFT JOIN Pagamentos p ON c.ID_Cliente = p.Cliente_ID
GROUP BY c.Cidade;   
    
SELECT * FROM relatorios_pagamentos;    