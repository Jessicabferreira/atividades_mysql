CREATE DATABASE db_colaboradores;   -- CRIAR O BANCO DE DADOS

USE db_colaboradores;

CREATE TABLE funcionarios (         -- CRIAR A TABELA DOS FUNCIONARIOS
    id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO funcionarios(nome, cargo, salario, data_admissao)         -- iNSERIR OS REGISTROS
VALUES ("Jefferson Santos", "Gerente de Projetos", 6500.00, "2021-09-17");
INSERT INTO funcionarios(nome, cargo, salario, data_admissao)
VALUES ("Gabriela Ferreira", "Estagiaria", 1500.00, "2025-11-25");
INSERT INTO funcionarios(nome, cargo, salario, data_admissao)
VALUES ("Yuri Mendes", "Assistente Administrativo", 1900.00, "2023-05-15");
INSERT INTO funcionarios(nome, cargo, salario, data_admissao)
VALUES ("Julia Souza", "Analista de HR", 2600.00, "2022-07-02");
INSERT INTO funcionarios(nome, cargo, salario, data_admissao)
VALUES ("Bruno Oscar", "Desenvolvedor", 8000.00, "2020-03-27");

SELECT * FROM funcionarios;

SELECT * FROM funcionarios      -- FUNCIONARIOS COM SALARIO MAIR QUE 2000
WHERE salario > 2000;


SELECT * FROM funcionarios     -- FUNCIONARIOS COM SALARIO MENOR QUE 2000
WHERE salario < 2000;

UPDATE funcionarios            -- ATUALIZAR REGISTRO
SET salario = 2000.00
WHERE id = 2;

UPDATE funcionarios            -- ATUALIZAR REGISTRO NOVAMENTE 
SET salario = 2300.00
WHERE id = 2;

