-- Criação do banco de dados para o registro da escola
CREATE DATABASE escola;

-- Seleção do banco de dados
USE escola;

-- Criação da tabela estudantes com 5 atributos
CREATE TABLE estudantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    serie VARCHAR(20),
    nota_final DECIMAL(3,1),
    data_matricula DATE
);

-- Inserção de 8 registros de estudantes
INSERT INTO estudantes (nome, idade, serie, nota_final, data_matricula)
VALUES 
('Amanda Ribeiro', 15, '9º Ano', 8.5, '2023-02-01'),
('Lucas Martins', 14, '8º Ano', 6.0, '2023-02-10'),
('Bruna Costa', 16, '1º Ano EM', 7.2, '2023-03-01'),
('Pedro Almeida', 13, '7º Ano', 5.5, '2023-02-15'),
('Juliana Souza', 15, '9º Ano', 9.1, '2023-02-05'),
('Felipe Rocha', 17, '2º Ano EM', 6.8, '2023-01-25'),
('Larissa Oliveira', 16, '1º Ano EM', 7.7, '2023-02-20'),
('Mateus Silva', 14, '8º Ano', 4.9, '2023-02-11');

-- SELECT: Estudantes com nota maior que 7.0
SELECT * FROM estudantes
WHERE nota_final > 7.0;

-- SELECT: Estudantes com nota menor que 7.0
SELECT * FROM estudantes
WHERE nota_final < 7.0;

-- Atualização de um registro (exemplo: atualizando nota do estudante com id = 2)
UPDATE estudantes
SET nota_final = 7.5
WHERE id = 2;
