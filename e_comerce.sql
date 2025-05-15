-- Criação do banco de dados para o e-commerce
CREATE DATABASE ecommerce;

-- Seleção do banco de dados
USE ecommerce;

-- Criação da tabela de produtos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10,2),
    estoque INT,
    data_cadastro DATE
);

-- Inserção de 8 registros de produtos
INSERT INTO produtos (nome, categoria, preco, estoque, data_cadastro)
VALUES 
('Notebook Dell Inspiron', 'Informática', 4500.00, 10, '2023-10-01'),
('Smartphone Samsung Galaxy S21', 'Celulares', 3200.00, 25, '2023-09-15'),
('Fone de Ouvido JBL', 'Áudio', 299.99, 50, '2023-07-20'),
('Monitor LG 24"', 'Informática', 800.00, 18, '2023-08-10'),
('Cadeira Gamer', 'Móveis', 650.00, 12, '2023-11-02'),
('Mouse Logitech Wireless', 'Acessórios', 150.00, 35, '2023-07-05'),
('Teclado Mecânico Redragon', 'Acessórios', 400.00, 22, '2023-06-30'),
('Impressora HP DeskJet', 'Periféricos', 520.00, 8, '2023-10-25');

-- SELECT: Produtos com valor maior que 500
SELECT * FROM produtos
WHERE preco > 500;

-- SELECT: Produtos com valor menor que 500
SELECT * FROM produtos
WHERE preco < 500;

-- Atualização de um registro (exemplo: alterando o estoque do produto com id = 4)
UPDATE produtos
SET estoque = 20
WHERE id = 4;
