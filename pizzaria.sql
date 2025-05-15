-- Criação do banco de dados
CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

-- Criação da tabela de categorias
CREATE TABLE tb_categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    tipo_categoria VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- Criação da tabela de pizzas
CREATE TABLE tb_pizzas (
    id_pizza INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(6,2) NOT NULL,
    tamanho VARCHAR(20),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (tipo_categoria, descricao) VALUES
('Salgada', 'Pizzas tradicionais e especiais com recheios salgados'),
('Doce', 'Pizzas com recheios doces'),
('Vegetariana', 'Pizzas sem carne, com vegetais e queijos'),
('Premium', 'Pizzas com ingredientes nobres e preços mais elevados'),
('Promoção', 'Pizzas com preço promocional para datas específicas');

-- Inserção de 8 registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome, descricao, preco, tamanho, id_categoria) VALUES
('Margherita', 'Molho de tomate, mussarela, manjericão', 42.00, 'Média', 1),
('Calabresa', 'Calabresa fatiada, cebola e queijo', 48.00, 'Grande', 1),
('Brigadeiro', 'Chocolate, granulado e leite condensado', 55.00, 'Média', 2),
('Quatro Queijos', 'Mussarela, parmesão, gorgonzola e catupiry', 60.00, 'Grande', 4),
('Veggie Lovers', 'Brócolis, tomate, cebola, milho e azeitonas', 50.00, 'Média', 3),
('Romeu e Julieta', 'Queijo e goiabada derretida', 47.00, 'Pequena', 2),
('Frango com Catupiry', 'Frango desfiado e catupiry', 52.00, 'Grande', 1),
('M&M’s', 'Chocolate derretido com M&M’s crocantes', 58.00, 'Média', 2);

-- SELECT: pizzas com valor maior que R$ 45,00
SELECT * FROM tb_pizzas
WHERE preco > 45.00;

-- SELECT: pizzas com valor entre R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas
WHERE preco BETWEEN 50.00 AND 100.00;

-- SELECT: pizzas com a letra "M" no nome
SELECT * FROM tb_pizzas
WHERE nome LIKE '%M%';

-- SELECT com INNER JOIN entre tb_pizzas e tb_categorias
SELECT p.*, c.tipo_categoria
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c
ON p.id_categoria = c.id_categoria;

-- SELECT com INNER JOIN apenas para pizzas da categoria "Doce"
SELECT p.*, c.tipo_categoria
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c
ON p.id_categoria = c.id_categoria
WHERE c.tipo_categoria = 'Doce';
