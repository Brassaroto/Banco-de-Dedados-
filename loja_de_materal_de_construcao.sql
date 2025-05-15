-- Criação do banco de dados
CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

-- Criação da tabela de categorias
CREATE TABLE tb_categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL,
    setor VARCHAR(100),
    descricao TEXT
);

-- Criação da tabela de produtos
CREATE TABLE tb_produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(7,2) NOT NULL,
    marca VARCHAR(50),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, setor, descricao) VALUES
('Hidráulica', 'Tubos e Conexões', 'Produtos para instalações de água e esgoto'),
('Elétrica', 'Fios e Iluminação', 'Materiais para instalações elétricas'),
('Ferragens', 'Portas e Janelas', 'Dobradiças, fechaduras e acessórios'),
('Acabamento', 'Revestimentos', 'Pisos, azulejos e outros acabamentos'),
('Construção Bruta', 'Cimento e Areia', 'Materiais pesados para a estrutura');

-- Inserção de 8 produtos na tabela tb_produtos
INSERT INTO tb_produtos (nome, descricao, preco, marca, id_categoria) VALUES
('Cimento CP II', 'Saco de cimento 50kg', 42.00, 'Votoran', 5),
('Torneira de PVC', 'Torneira para jardim', 75.00, 'Tigre', 1),
('Fio Flexível 2,5mm', 'Rolo com 100 metros', 120.00, 'Sil', 2),
('Interruptor Simples', 'Interruptor com placa', 35.00, 'Pial', 2),
('Caixa d’água 500L', 'Polietileno, tampa rosqueável', 290.00, 'Fortlev', 1),
('Fechadura para Porta', 'Fechadura com chaves', 85.00, 'Pado', 3),
('Piso Cerâmico 60x60', 'Caixa com 2m²', 145.00, 'Eliane', 4),
('Conduíte Flexível', 'Rolo 25 metros, 3/4 polegadas', 65.00, 'Amanco', 2);

-- SELECT: produtos com valor > R$ 100,00
SELECT * FROM tb_produtos
WHERE preco > 100.00;

-- SELECT: produtos com valor entre R$ 70,00 e R$ 150,00
SELECT * FROM tb_produtos
WHERE preco BETWEEN 70.00 AND 150.00;

-- SELECT: produtos com a letra "C" no nome
SELECT * FROM tb_produtos
WHERE nome LIKE '%C%';

-- SELECT com INNER JOIN: unindo dados das duas tabelas
SELECT p.*, c.nome_categoria, c.setor
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c
ON p.id_categoria = c.id_categoria;

-- SELECT com INNER JOIN: apenas produtos da categoria "Hidráulica"
SELECT p.*, c.nome_categoria
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c
ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Hidráulica';
