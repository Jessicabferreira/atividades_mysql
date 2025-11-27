CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

-- Criar primeira tabela Categorias
CREATE TABLE tb_categorias(
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(50) NOT NULL,
	descricao VARCHAR(100)
);

-- Inserir registros da primeira tabela
INSERT INTO tb_categorias(tipo, descricao)
VALUES ("Salgada Tradicional", "Pizzas salgadas tradicionais");
INSERT INTO tb_categorias(tipo, descricao)
VALUES ("Salgada Especial", "Pizzas especiais da casa");
INSERT INTO tb_categorias(tipo, descricao)
VALUES ("Doce", "Pizzas doces");
INSERT INTO tb_categorias(tipo, descricao)
VALUES ("Vegetariana", "Pizzas sem carne");
INSERT INTO tb_categorias(tipo, descricao)
VALUES ("Premium", "Pizzas gourmet");

SELECT * FROM tb_categorias;

-- Criar segunda tabela pizzas
CREATE TABLE tb_pizzas(
	id_pizza INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
	tamanho VARCHAR(20),
    borda_recheada BOOLEAN,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserir registros da segunda tabela
INSERT INTO tb_pizzas(nome, valor, tamanho, borda_recheada, id_categoria)
VALUES ("Frango com Catupiry", 55.00, "Grande", TRUE, 1);
INSERT INTO tb_pizzas(nome, valor, tamanho, borda_recheada, id_categoria)
VALUES ("Mussarela", 42.00, "Média", FALSE, 1);
INSERT INTO tb_pizzas(nome, valor, tamanho, borda_recheada, id_categoria)
VALUES ("Calabreza", 48.00, "Grande", TRUE, 2);
INSERT INTO tb_pizzas(nome, valor, tamanho, borda_recheada, id_categoria)
VALUES ("Quatro queijos", 60.00, "Grande", TRUE, 2);
INSERT INTO tb_pizzas(nome, valor, tamanho, borda_recheada, id_categoria)
VALUES ("Chocolate", 52.00, "Média", FALSE, 3);
INSERT INTO tb_pizzas(nome, valor, tamanho, borda_recheada, id_categoria)
VALUES ("Banana com Canela", 50.00, "Média", FALSE, 3);
INSERT INTO tb_pizzas(nome, valor, tamanho, borda_recheada, id_categoria)
VALUES ("Vegetariana", 58.00, "Grande", TRUE, 4);
INSERT INTO tb_pizzas(nome, valor, tamanho, borda_recheada, id_categoria)
VALUES ("Premium Camarão", 98.00, "Grande", TRUE, 5);

-- Exibir dados
SELECT * FROM tb_pizzas;

-- Pizzas com o valor MAIOR que R$ 45,00
SELECT * FROM tb_pizzas
WHERE valor > 45.00;

-- Pizzas com o valor ENTRE R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas
WHERE valor BETWEEN 50.00 AND 100.00;

-- Pizzas com letra M no mome
SELECT * FROM tb_pizzas
WHERE nome LIKE "%M%";

-- Unir os dados da tb_pizzas com a tb_categorias
SELECT 
	tb_pizzas.nome,
    tb_pizzas.valor,
    tb_pizzas.tamanho,
    tb_categorias.tipo AS categoria
FROM tb_pizzas
INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id_categoria;

-- Unir tabelas e trazer apenas as pizzas que pertençam a uma categoria específica "Doce"
SELECT 
	tb_pizzas.nome,
    tb_pizzas.valor,
    tb_pizzas.tamanho,
    tb_categorias.tipo AS categoria
FROM tb_pizzas
INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.tipo = "Doce";
