-- APAGA/DELETA O BD
DROP DATABASE db_quitanda;

-- CRIA O DB
CREATE DATABASE db_quitanda;

-- CRIA O DB
USE db_quitanda;   

-- CRIANDO A TABELA CATEGORIAS
CREATE TABLE tb_categorias(  
	id bigint AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
);

-- CADRASTAR OS DADOS NA TB CATEGORIA
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");

INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");

INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");

INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");

INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");

INSERT INTO tb_categorias (descricao)
VALUES ('Outros');

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	quantidade INT,
    datavalidade DATE,
	preco DECIMAL(6,2) NOT NULL,
    categoriaid BIGINT,           -- CAMPO DE RELACIONAMENTO/ CHAVE ESTRANGEIRA
    
    PRIMARY KEY (id),
    FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 
values ("tomate",100, "2023-12-15", 8.00, 3);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 
values ("maçã",20, "2023-12-15", 5.00, 1);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 
values ("laranja",50, "2023-12-15", 10.00, 1);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 
values ("banana",200, "2023-12-15", 12.00, 1);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 
values ("uva",1200, "2023-12-15", 30.00, 1);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 
values ("pêra",500, "2023-12-15", 2.99, 1);

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);
INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);
INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);
INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);
INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);
INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);
INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);
INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);
INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);
INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);
INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);
INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Grapefruit", 3000, "2022-03-13", 50.00, 1);
INSERT INTO tb_produtos (nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);
INSERT INTO tb_produtos (nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

SELECT * FROM tb_produtos;

-- ORDENAÇÃO POR NOME
SELECT * FROM tb_produtos ORDER BY nome ASC;   -- ORDENAR ATRAVES DO NOME EM ORDEM ACENDENTE/ ORDEM ALFABETICA

SELECT * FROM tb_produtos ORDER BY nome DESC;  -- ORDENAR COMEÇANDO DO FINAL/ EXE: NOTAS MAIORES ATÉ MENORES 

-- SELEÇÃO POR LISTA DE CRITERIOS
SELECT * FROM tb_produtos WHERE preco IN (5.00, 10.00, 15.00);

-- CONSULTA INNER JOIN SÓ TRAIS O QUE TEM RELACIONAMENTO
SELECT nome, preco, quantidade, tb_categorias.descricao   -- O QUE REPRESENTA O ID 1/ QUERO A INFORMAÇÃO
FROM tb_produtos INNER JOIN tb_categorias                 -- INNER JOIN SELECIONA TODOS OS DADOS DA TABELA PRODUTOS ONDE TEM RELACIONAMENTO COM CATEGORIA
ON tb_produtos.categoriaid = tb_categorias.id;  

-- CONSULTA LEFT JOIN
SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos LEFT JOIN tb_categorias                   -- MOSTRA TODOS PRODUTOS TENDO RELACIONAMENTO OU NÃO / AS SACOLAS QUE NÃO TEM RELACIONAMNETO E APARECE TAMBÉM
ON tb_produtos.categoriaid = tb_categorias.id;

SELECT * FROM tb_produtos;

-- CONSULTA RIGHT JOIN
SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos RIGHT JOIN tb_categorias                -- MESMA COISA DO LEFT MAIS APARECE COMO OUTROS OS PRODUTOS QUE NÃO TEM RELACIONAMENTO
ON tb_produtos.categoriaid = tb_categorias.id;
