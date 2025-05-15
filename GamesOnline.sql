-- Criação do banco de dados
CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

-- Criação da tabela de classes
CREATE TABLE tb_classes (
    id_classe INT PRIMARY KEY AUTO_INCREMENT,
    nome_classe VARCHAR(50) NOT NULL,
    tipo_arma VARCHAR(50) NOT NULL
);

-- Criação da tabela de personagens
CREATE TABLE tb_personagens (
    id_personagem INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);

-- Inserção de 5 registros na tabela tb_classes
INSERT INTO tb_classes (nome_classe, tipo_arma) VALUES
('Guerreiro', 'Espada'),
('Arqueiro', 'Arco e Flecha'),
('Mago', 'Cajado'),
('Ladino', 'Adagas'),
('Paladino', 'Martelo');

-- Inserção de 8 registros na tabela tb_personagens
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, id_classe) VALUES
('Arthas', 2500, 1500, 10, 1),
('Celina', 1800, 1000, 8, 2),
('Morgana', 3000, 1200, 12, 3),
('Darius', 2200, 1900, 11, 1),
('Felipe', 1300, 1700, 7, 5),
('Carlos', 2100, 800, 9, 2),
('Cassandra', 2700, 1100, 10, 3),
('Luna', 900, 1600, 6, 4);

-- SELECT: personagens com poder de ataque maior que 2000
SELECT * FROM tb_personagens
WHERE poder_ataque > 2000;

-- SELECT: personagens com poder de defesa entre 1000 e 2000
SELECT * FROM tb_personagens
WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT: personagens cujo nome contém a letra 'C'
SELECT * FROM tb_personagens
WHERE nome LIKE '%C%';

-- SELECT com INNER JOIN entre tb_personagens e tb_classes
SELECT p.*, c.nome_classe, c.tipo_arma
FROM tb_personagens AS p
INNER JOIN tb_classes AS c
ON p.id_classe = c.id_classe;

-- SELECT com INNER JOIN para personagens da classe "Arqueiro"
SELECT p.*, c.nome_classe
FROM tb_personagens AS p
INNER JOIN tb_classes AS c
ON p.id_classe = c.id_classe
WHERE c.nome_classe = 'Arqueiro';
