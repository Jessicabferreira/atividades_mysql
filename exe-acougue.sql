CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

-- Criar primeira tabela Categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(100)
);

-- Inserir registros da primeira tabela
INSERT INTO tb_categorias(nome_categoria, descricao) 
VALUES ("Bovinos", "Carnes de boi");
INSERT INTO tb_categorias(nome_categoria, descricao)
VALUES ("Suínos", "Carnes de porco");
INSERT INTO tb_categorias(nome_categoria, descricao)
VALUES ("Aves", "Carnes de frango e aves");
INSERT INTO tb_categorias(nome_categoria, descricao)
VALUES ("Embutidos", "Linguiças e derivados");
INSERT INTO tb_categorias(nome_categoria, descricao)
VALUES ("Cortes Premium", "Carnes nobres");

SELECT * FROM tb_categorias;

-- Criar segunda tabela Produtos
CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    valor DECIMAL(8,2) NOT NULL,
    fornecedor VARCHAR(60),
    peso_kg DECIMAL(5,2),
    id_categoria INT,

    FOREIGN KEY (id_categoria)
        REFERENCES tb_categorias(id_categoria)
);

-- Inserir registros da segunda tabela
INSERT INTO tb_produtos (nome, valor, fornecedor, peso_kg, id_categoria) 
VALUES ("Picanha", 129.90, "Friboi", 1.00, 5);
INSERT INTO tb_produtos (nome, valor, fornecedor, peso_kg, id_categoria) 
VALUES ("Alcatra", 79.90, "JBS", 1.00, 1);
INSERT INTO tb_produtos (nome, valor, fornecedor, peso_kg, id_categoria) 
VALUES ("Filé de Frango", 22.90, "Sadia", 1.00, 3);
INSERT INTO tb_produtos (nome, valor, fornecedor, peso_kg, id_categoria) 
VALUES ("Costela Bovina", 59.90, "Minerva", 2.00, 1);
INSERT INTO tb_produtos (nome, valor, fornecedor, peso_kg, id_categoria) 
VALUES ("Linguiça Toscana", 34.90, "Perdigão", 1.00, 4);
INSERT INTO tb_produtos (nome, valor, fornecedor, peso_kg, id_categoria) 
VALUES ("Bacon", 48.00, "Seara", 1.00, 2);
INSERT INTO tb_produtos (nome, valor, fornecedor, peso_kg, id_categoria) 
VALUES ("Coxinha da Asa", 26.50, "Aurora", 1.00, 3);
INSERT INTO tb_produtos (nome, valor, fornecedor, peso_kg, id_categoria)
VALUES ("Costela Suína", 54.90, "Aurora", 1.50, 2);

SELECT * FROM tb_produtos;

-- Produtos com o valor MAIOR que R$ 50,00
SELECT * FROM tb_produtos
WHERE valor > 50.00;

-- Produtos com valor entre R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos
WHERE valor BETWEEN 5.00 AND 60.00;

-- Produtos que possuem a letra C no nome
SELECT * FROM tb_produtos
WHERE nome LIKE "%C%";

-- Unindo produtos e categorias
SELECT 
    tb_produtos.nome AS Produto,
    tb_produtos.valor,
    tb_produtos.fornecedor,
    tb_produtos.peso_kg,
    tb_categorias.nome_categoria AS Categoria
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria;

-- Unir tabelas e trazer apenas os produtos que pertençam a uma categoria específica "Aves"
SELECT 
    tb_produtos.nome AS Produto,
    tb_produtos.valor,
    tb_produtos.fornecedor,
    tb_categorias.nome_categoria AS Categoria
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = "Aves";
