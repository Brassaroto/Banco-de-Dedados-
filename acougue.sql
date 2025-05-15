-- Criação do banco de dados
CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

-- Criação da tabela de categorias
CREATE TABLE tb_categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- Criação da tabela de produtos
CREATE TABLE tb_produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(7,2) NOT NULL,
    peso_kg DECIMAL(5,2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de 5 categorias
INSERT INTO tb_categorias (nome_categoria, descricao) VALUES
('Bovinos', 'Carnes de gado, cortes variados'),
('Suínos', 'Produtos derivados de porco'),
('Aves', 'Frangos, galinhas e derivados'),
('Embutidos', 'Produtos processados como linguiça e salsicha'),
('Exóticos', 'Carnes especiais como cordeiro e javali');

-- Inserção de 8 produtos
INSERT INTO tb_produtos (nome, descricao, preco, peso_kg, id_categoria) VALUES
('Picanha Bovina', 'Corte nobre bovino', 120.00, 1.2, 1),
('Costela Suína', 'Costela de porco temperada', 48.00, 1.5, 2),
('Frango Inteiro', 'Frango com aproximadamente 2kg', 35.00, 2.0, 3),
('Linguiça Toscana', 'Linguiça suína artesanal', 52.00, 1.0, 4),
('Javali Moído', 'Carne exótica moída', 160.00, 1.0, 5),
('Coração de Frango', 'Ideal para churrasco', 65.00, 1.0, 3),
('Copa Lombo Suíno', 'Corte especial suíno', 58.00, 1.0, 2),
('Cordeiro Patinho', 'Carne de cordeiro', 140.00, 1.3, 5);

-- SELECT: produtos com valor > R$ 50,00
SELECT * FROM tb_produtos
WHERE preco > 50.00;

-- SELECT: produtos com valor entre R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos
WHERE preco BETWEEN 50.00 AND 150.00;

-- SELECT: produtos com a letra "C" no nome
SELECT * FROM tb_produtos
WHERE nome LIKE '%C%';

-- SELECT com INNER JOIN: todas as informações dos produtos com suas categorias
SELECT p.*, c.nome_categoria
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c
ON p.id_categoria = c.id_categoria;

-- SELECT com INNER JOIN: apenas produtos da categoria "Aves"
SELECT p.*, c.nome_categoria
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c
ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Aves';
