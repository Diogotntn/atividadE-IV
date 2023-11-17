CREATE DATABASE Pedidos;
USE Pedidos;

CREATE TABLE Cliente (
ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL UNIQUE,
Telefone VARCHAR(255) NOT NULL
);

INSERT INTO Cliente(Nome, Email, Telefone) 
VALUES ('SGT', 'SGT@gmail.com', "7198824-4052");
INSERT INTO Cliente(Nome, Email, Telefone) 
VALUES ('SGT', 'SGT_jesus@gmail.com', "719899-9999");
INSERT INTO Cliente(Nome, Email, Telefone) 
VALUES ('SGT', 'SGT_santos@gmail.com', "7198555-5050");
INSERT INTO Cliente(Nome, Email, Telefone) 
VALUES ('Mirian', 'Mirian@gmail.com', "7195050-5050");
INSERT INTO Cliente(Nome, Email, Telefone) 
VALUES('Dani', 'Dani@gmail.com', "7192424-2424");
 
 
CREATE TABLE Pedido (
ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Data_incio DATE NOT NULL,
Valor_total DOUBLE NOT NULL,
Cliente_ID INT NOT NULL,
FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID_Cliente)
);

INSERT INTO Pedido(Nome, Data_incio, Valor_total, Cliente_ID) 
VALUES ('Carro', '2005-02-03', 50.00, 1); 

CREATE VIEW relatorios_pedidos AS
SELECT C.Nome AS NomeCliente, COUNT(ID_Pedido) AS numeroPedido, SUM(Valor_total) AS ValorTotal_Gasto
FROM Cliente c
LEFT JOIN Pedido p ON c.ID_Cliente = p.Cliente_ID
GROUP BY c.Nome;
 
SELECT * FROM relatorios_pedidos_cliente;