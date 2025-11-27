CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

-- Criar primeira tabela
CREATE TABLE tb_classes(
	id_classe INT AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(50) NOT NULL,
    tipo_arma VARCHAR(50) NOT NULL,
    descricao VARCHAR(100)
);

-- Inserir registros da primeira tabela
INSERT INTO tb_classes(nome_classe, tipo_arma, descricao)
VALUES ("Guerreiro", "Espada", "Combate corpo a corpo");
INSERT INTO tb_classes(nome_classe, tipo_arma, descricao)
VALUES ("Arqueiro", "Arco e flecha", "Combate a distância");
INSERT INTO tb_classes(nome_classe, tipo_arma, descricao)
VALUES ("Mago", "Cajado", "Ataques mágicos"); 
INSERT INTO tb_classes(nome_classe, tipo_arma, descricao)
VALUES ("Assassino", "Adagas", "Ataques furtivos");
INSERT INTO tb_classes(nome_classe, tipo_arma, descricao)
VALUES ("Paladino", "Martelo", "Defesa e ataque sagrado");

SELECT * FROM tb_classes;

-- ID 2 ficou duplicado, por isso foi removido
DELETE FROM tb_classes WHERE id_classe = 2;

-- Criar segunda tabela
CREATE TABLE tb_personagens(
	id_personagem INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	nivel INT NOT NULL,
	poder_ataque INT NOT NULL,
	poder_defesa INT NOT NULL,
	id_classe INT,
	FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);

SELECT * FROM tb_personagens;

-- Inserir registros da segunda tabela
INSERT INTO tb_personagens(nome, nivel, poder_ataque, poder_defesa, id_classe)
VALUES ("Jessica", 15, 2500, 1800, 1);
INSERT INTO tb_personagens(nome, nivel, poder_ataque, poder_defesa, id_classe)
VALUES ("Vinicius", 12, 1900, 1200, 6);
INSERT INTO tb_personagens(nome, nivel, poder_ataque, poder_defesa, id_classe)
VALUE ("Yuri", 18, 3000, 1500, 3);
INSERT INTO tb_personagens(nome, nivel, poder_ataque, poder_defesa, id_classe)
VALUES ("Bruna", 20, 2100, 2200, 5);
INSERT INTO tb_personagens(nome, nivel, poder_ataque, poder_defesa, id_classe)
VALUES ("Juan", 10, 1700, 900, 6);
INSERT INTO tb_personagens(nome, nivel, poder_ataque, poder_defesa, id_classe)
VALUES ("Aline", 22, 2800, 1600, 4);
INSERT INTO tb_personagens(nome, nivel, poder_ataque, poder_defesa, id_classe)
VALUES ("Felipe", 14, 1600, 2000, 5);
INSERT INTO tb_personagens(nome, nivel, poder_ataque, poder_defesa, id_classe)
VALUES ("Tayene", 16, 2300, 1300, 1);

-- Mostrar personagens com poder de ataque MAIOR que 2000
SELECT * FROM tb_personagens
WHERE poder_ataque > 2000;

-- Mostrar personagens com poder de ataque entre 1000 e 2000
SELECT * FROM tb_personagens
WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Mostrar personagens que possuem a letra C no atributo nome
SELECT * FROM tb_personagens
WHERE nome LIKE "%C%";

-- Unir os dados da tabela tb_personagens com os dados da tabela tb_classes
SELECT 
	tb_personagens.id_personagem,
	tb_personagens.nome,
	tb_personagens.nivel,
	tb_personagens.poder_ataque,
	tb_personagens.poder_defesa,
	tb_classes.nome_classe,
	tb_classes.tipo_arma
FROM tb_personagens
INNER JOIN tb_classes 
ON tb_personagens.id_classe = tb_classes.id_classe;


-- Filtra apenas o Arqueiros
SELECT 
	tb_personagens.nome,
	tb_personagens.nivel,
	tb_personagens.poder_ataque,
	tb_personagens.poder_defesa,
	tb_classes.nome_classe
FROM tb_personagens
INNER JOIN tb_classes 
ON tb_personagens.id_classe = tb_classes.id_classe
WHERE tb_classes.nome_classe = "Arqueiro";
