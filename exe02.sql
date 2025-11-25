CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    data_cadastro DATE NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO produtos(nome, categoria, preco, estoque, data_cadastro)
VALUES ("Ração Premium para Cães 10kg", "Alimentos para Pets", 159.90, 25, "2024-05-01");
INSERT INTO produtos(nome, categoria, preco, estoque, data_cadastro)
VALUES ("Ração para Gatos Adultos 5kg", "Alimentos para Pets", 89.90, 40, "2024-05-02");
INSERT INTO produtos(nome, categoria, preco, estoque, data_cadastro)
VALUES ("Coleira Antipulgas para Cães", "Acessórios para Pets", 120.00, 30, "2024-05-03");
INSERT INTO produtos(nome, categoria, preco, estoque, data_cadastro)
VALUES ("Brinquedo Bola com Corda", "Brinquedos para Pets", 35.00, 60, "2024-05-05");
INSERT INTO produtos(nome, categoria, preco, estoque, data_cadastro)
VALUES ("Caminha Pequena para Pets", "Conforto para Pets", 199.00, 15, "2024-05-06");
INSERT INTO produtos(nome, categoria, preco, estoque, data_cadastro)
VALUES ("Shampoo Neutro para Cães", "Higiene e Cuidados", 32.90, 50, "2024-05-10");
INSERT INTO produtos(nome, categoria, preco, estoque, data_cadastro)
VALUES ("Arranhador para Gatos", "Acessórios para Pets", 210.00, 20, "2024-05-12");
INSERT INTO produtos(nome, categoria, preco, estoque, data_cadastro)
VALUES ("Comedouro Duplo Inox", "Acessórios para Pets", 49.90, 35, "2024-05-13");

SELECT * FROM produtos;

SELECT * FROM produtos
WHERE preco > 500;

SELECT * FROM produtos
WHERE preco < 500;

UPDATE produtos
SET preco = 530.00
WHERE id = 5;