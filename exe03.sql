CREATE DATABASE db_escola;
USE db_escola;

CREATE TABLE estudantes(
    id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    turma VARCHAR(20) NOT NULL,
    nota DECIMAL(3,1) NOT NULL,
    data_matricula DATE NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO estudantes(nome, idade, turma, nota, data_matricula)
VALUES ("Jessica Ferreira", 15, "8A", 8.5, "2025-02-10");
INSERT INTO estudantes(nome, idade, turma, nota, data_matricula)
VALUES ("Pedro Souza", 14, "9B", 6.8, "2025-02-12");
INSERT INTO estudantes(nome, idade, turma, nota, data_matricula)
VALUES ("Monica Silva", 15, "7A", 7.2, "2025-02-15");
INSERT INTO estudantes(nome, idade, turma, nota, data_matricula)
VALUES ("Roberto Santos", 16, "9A", 5.5, "2025-02-18");
INSERT INTO estudantes(nome, idade, turma, nota, data_matricula)
VALUES ("Laura Lima", 12, "6B", 9.1, "2025-02-20");
INSERT INTO estudantes(nome, idade, turma, nota, data_matricula)
VALUES ("Felipe Martins", 14, "8B", 4.9, "2025-02-22");
INSERT INTO estudantes(nome, idade, turma, nota, data_matricula)
VALUES ("João Pedro", 13, "7B", 8.0, "2025-02-14");
INSERT INTO estudantes(nome, idade, turma, nota, data_matricula)
VALUES ("Sofia Almeida", 12, "6A", 7.9, "2025-02-25");

SELECT * FROM estudantes
WHERE nota > 7.0;

SELECT * FROM estudantes
WHERE nota < 7.0;

UPDATE estudantes
SET nota = 9.5
WHERE id = 2;