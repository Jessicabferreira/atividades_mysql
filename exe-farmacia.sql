CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

-- Criar primeira tabela Categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(100)
);

-- Inserir registros da primeira tabela
INSERT INTO tb_categorias(nome_categoria, descricao)
VALUES ("Medicamentos", "Remédios em geral");
INSERT INTO tb_categorias(nome_categoria, descricao)
VALUES ("Higiene", "Produtos de higiene pessoal");
INSERT INTO tb_categorias(nome_categoria, descricao)
VALUES ("Cosméticos", "Produtos de beleza");
INSERT INTO tb_categorias(nome_categoria, descricao)
VALUES ("Vitaminas", "Suplementos e vitaminas");
INSERT INTO tb_categorias(nome_categoria, descricao)
VALUES ("Infantil", "Produtos para bebês");

SELECT * FROM tb_categorias;

-- Criar segunda tabela Produtos
CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    fabricante VARCHAR(60),
    quantidade_estoque INT,
    id_categoria INT,

    FOREIGN KEY (id_categoria)
        REFERENCES tb_categorias(id_categoria)
);

-- Inserir registros da segunda tabela
INSERT INTO tb_produtos(nome, valor, fabricante, quantidade_estoque, id_categoria)
VALUES ("Dipirona 500mg", 12.50, "NeoQuímica", 100, 1);
INSERT INTO tb_produtos(nome, valor, fabricante, quantidade_estoque, id_categoria)
VALUES ("Paracetamol 750mg", 18.00, "Medley", 80, 1);
INSERT INTO tb_produtos(nome, valor, fabricante, quantidade_estoque, id_categoria)
VALUES ("Shampoo Anticaspa", 32.90, "Clear", 40, 2);
INSERT INTO tb_produtos(nome, valor, fabricante, quantidade_estoque, id_categoria)
VALUES ("Creme Hidratante", 45.00, "Nivea", 35, 3);
INSERT INTO tb_produtos(nome, valor, fabricante, quantidade_estoque, id_categoria)
VALUES ("Vitamina C", 55.90, "Lavitan", 60, 4);
INSERT INTO tb_produtos(nome, valor, fabricante, quantidade_estoque, id_categoria)
VALUES ("Fralda Infantil", 68.00, "Pampers", 50, 5);
INSERT INTO tb_produtos(nome, valor, fabricante, quantidade_estoque, id_categoria)
VALUES ("Protetor Solar", 79.90, "La Roche", 25, 3);
INSERT INTO tb_produtos(nome, valor, fabricante, quantidade_estoque, id_categoria)
VALUES ("Sabonete Líquido", 9.90, "Dove", 90, 2);

SELECT * FROM tb_produtos;  

-- ID 2 ficou duplicado, por isso foi removido
DELETE FROM tb_produtos WHERE id_produto = 2; 

SELECT * FROM tb_produtos; 

-- Produtos com o valor MAIOR que R$ 50,00
SELECT * FROM tb_produtos
WHERE valor > 50.00;

-- Produtos com valor entre R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos
WHERE valor BETWEEN 5.00 AND 60.00;

-- Produtos que possuem a letra C no nome
SELECT * FROM tb_produtos
WHERE nome LIKE "%C%";

-- Unindo produtos e categorias
SELECT 
    tb_produtos.nome AS Produto,
    tb_produtos.valor,
    tb_produtos.fabricante,
    tb_categorias.nome_categoria AS Categoria
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria;

-- Unir tabelas e trazer apenas os produtos que pertençam a uma categoria específica "cosméticos "
SELECT 
    tb_produtos.nome AS Produto,
    tb_produtos.valor,
    tb_produtos.fabricante,
    tb_produtos.quantidade_estoque,
    tb_categorias.nome_categoria AS Categoria
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = "Cosméticos";
