-- Criação do banco de dados
CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

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
    preco DECIMAL(6,2) NOT NULL,
    estoque INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao) VALUES
('Medicamentos', 'Remédios com e sem prescrição'),
('Higiene Pessoal', 'Produtos para cuidados diários'),
('Dermocosméticos', 'Produtos para cuidado com a pele'),
('Vitaminas e Suplementos', 'Produtos para reforço alimentar e imunológico'),
('Infantil', 'Produtos voltados para o cuidado infantil');

-- Inserção de 8 registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, descricao, preco, estoque, id_categoria) VALUES
('Paracetamol 750mg', 'Analgésico e antitérmico', 12.50, 120, 1),
('Sabonete Líquido Antisséptico', 'Higiene das mãos e corpo', 18.00, 85, 2),
('Vitamina C 1g', 'Reforço imunológico em comprimido efervescente', 25.00, 60, 4),
('Protetor Solar FPS 50', 'Proteção solar para todos os tipos de pele', 59.90, 45, 3),
('Pomada contra assaduras', 'Uso diário em bebês', 13.75, 90, 5),
('Xampu Anticaspa', 'Tratamento capilar', 32.00, 50, 2),
('Colágeno Hidrolisado', 'Suplemento alimentar em pó', 89.00, 30, 4),
('Creme Facial com Vitamina C', 'Cuidado anti-idade e luminosidade', 75.50, 25, 3);

-- SELECT: produtos com valor maior que R$ 50,00
SELECT * FROM tb_produtos
WHERE preco > 50.00;

-- SELECT: produtos com valor entre R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos
WHERE preco BETWEEN 5.00 AND 60.00;

-- SELECT: produtos que possuem a letra "C" no nome
SELECT * FROM tb_produtos
WHERE nome LIKE '%C%';

-- SELECT com INNER JOIN entre tb_produtos e tb_categorias
SELECT p.*, c.nome_categoria
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c
ON p.id_categoria = c.id_categoria;
