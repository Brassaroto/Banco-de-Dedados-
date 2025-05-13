-- Criação do banco de dados
CREATE DATABASE rh_empresa;

-- Seleção do banco de dados para uso
USE rh_empresa;

-- Criação da tabela de colaboradores
CREATE TABLE colaboradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    departamento VARCHAR(50),
    salario DECIMAL(10,2),
    data_admissao DATE
);

-- Inserção de registros na tabela
INSERT INTO colaboradores (nome, cargo, departamento, salario, data_admissao)
VALUES 
('Ana Souza', 'Analista de RH', 'Recursos Humanos', 3500.00, '2022-05-10'),
('Carlos Lima', 'Auxiliar Administrativo', 'Administrativo', 1800.00, '2021-09-15'),
('Beatriz Silva', 'Gerente de Projetos', 'TI', 5200.00, '2020-03-12'),
('João Pereira', 'Desenvolvedor Júnior', 'TI', 1900.00, '2023-01-05'),
('Mariana Rocha', 'Assistente de RH', 'Recursos Humanos', 2100.00, '2022-07-25');

-- Seleciona todos os colaboradores com salário maior que 2000
SELECT * FROM colaboradores
WHERE salario > 2000;

-- Seleciona todos os colaboradores com salário menor que 2000
SELECT * FROM colaboradores
WHERE salario < 2000;

-- Atualiza o salário do colaborador com id 2 para 2000.00
UPDATE colaboradores
SET salario = 2000.00
WHERE id = 2;
