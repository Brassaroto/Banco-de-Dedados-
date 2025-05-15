-- Criação do banco de dados
CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

-- Criação da tabela de categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Criação da tabela de cursos
CREATE TABLE tb_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    carga_horaria INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção de 5 categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Programação', 'Cursos voltados ao desenvolvimento de software'),
('Design', 'Cursos de design gráfico e digital'),
('Marketing', 'Estratégias de marketing e vendas'),
('Negócios', 'Administração, gestão e empreendedorismo'),
('Idiomas', 'Cursos de aprendizado de línguas');

-- Inserção de 8 cursos
INSERT INTO tb_cursos (nome, descricao, carga_horaria, valor, categoria_id) VALUES
('Java para Iniciantes', 'Curso completo de Java do básico ao avançado', 40, 750.00, 1),
('Design Gráfico com Photoshop', 'Aprenda design com Photoshop CC', 30, 499.99, 2),
('Marketing Digital', 'SEO, redes sociais e anúncios pagos', 35, 899.00, 3),
('Gestão Empresarial', 'Conceitos de administração moderna', 60, 1200.00, 4),
('Inglês Intermediário', 'Curso para ampliar vocabulário e conversação', 50, 650.00, 5),
('Java Web', 'Criação de aplicações web com Java', 45, 980.00, 1),
('Illustrator do Zero', 'Domine o Adobe Illustrator para design vetorial', 25, 570.00, 2),
('Espanhol Básico', 'Curso de espanhol para iniciantes', 40, 480.00, 5);

-- SELECT 1: Cursos com valor maior que R$ 500,00
SELECT * FROM tb_cursos
WHERE valor > 500.00;

-- SELECT 2: Cursos com valor entre R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos
WHERE valor BETWEEN 600.00 AND 1000.00;

-- SELECT 3: Cursos com letra J no nome
SELECT * FROM tb_cursos
WHERE nome LIKE '%J%';

-- SELECT 4: INNER JOIN entre cursos e categorias (todos os dados)
SELECT c.id, c.nome AS nome_curso, c.valor, cat.nome AS categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id;

-- SELECT 5: INNER JOIN filtrando por categoria específica (ex: Java)
SELECT c.id, c.nome AS nome_curso, c.valor, cat.nome AS categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id
WHERE cat.nome = 'Programação';
