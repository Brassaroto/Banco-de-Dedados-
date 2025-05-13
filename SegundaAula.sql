-- Apagar o Banco de Dados existente 'db_quitanda'
DROP DATABASE db_quitanda;
 
-- Recriar o Banco de Dados 'db_quitanda'
CREATE DATABASE db_quitanda;
 
-- Selecionar o Banco de Dados 'db_quitanda' para uso
USE db_quitanda;
 
-- Criar a tabela 'tb_categorias' para armazenar diferentes categorias de produtos
CREATE TABLE tb_categorias(
    id bigint AUTO_INCREMENT,  -- Identificador único para cada categoria
    descricao varchar(255) NOT NULL,  -- Descrição da categoria, não pode ser nula
    PRIMARY KEY (id)  -- Define a coluna 'id' como chave primária
);
 
-- Inserir dados na tabela 'tb_categorias' com diferentes tipos de produtos
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");
 
INSERT INTO tb_categorias (descricao)
VALUES ("outros");
 
-- Exibir todos os dados da tabela 'tb_categorias'
SELECT * FROM tb_categorias;
 
-- Criar a tabela 'tb_produtos' para armazenar informações sobre os produtos
CREATE TABLE tb_produtos(
    id bigint AUTO_INCREMENT,  -- Identificador único para cada produto
    nome varchar(255) NOT NULL,  -- Nome do produto, não pode ser nulo
    quantidade int,  -- Quantidade disponível do produto
    dtvalidade date NULL,  -- Data de validade do produto (pode ser nula)
    preco decimal(6, 2),  -- Preço do produto com 2 casas decimais
    categoria_id bigint,  -- ID da categoria do produto, chave estrangeira
    PRIMARY KEY (id),  -- Define a coluna 'id' como chave primária
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)  -- Relaciona a categoria do produto com a tabela 'tb_categorias'
);
 
-- Inserir dados na tabela 'tb_produtos' para diferentes produtos, associando-os às categorias
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);
 
-- Inserir dados para produtos que não têm data de validade, como sacolas
INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);
 
INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);
 
-- Visualizar todos os dados da tabela 'tb_produtos'
SELECT * FROM tb_produtos;
 
-- Selecionar produtos com preço menor ou igual a 2
SELECT * FROM tb_produtos WHERE preco <= 2;
 
-- Selecionar produtos com preços específicos (5, 10, 15) e ordenar por preço decrescente
SELECT * FROM tb_produtos WHERE preco IN (5,10,15) ORDER BY preco DESC;
 
-- Selecionar produtos com preço entre 5 e 20 e ordenar por preço decrescente
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 20 ORDER BY preco DESC;
 
-- Selecionar produtos com data de validade entre 2022-03-07 e 2022-03-10, ordenados pela data de validade
SELECT * FROM tb_produtos WHERE dtvalidade BETWEEN "2022-03-07" AND "2022-03-10" ORDER BY dtvalidade DESC;
 
-- Selecionar produtos cujo nome contém a sequência 'ra'
SELECT * FROM tb_produtos WHERE nome LIKE "%ra%";
 
-- Selecionar produtos cujo nome termina com 'ra'
SELECT * FROM tb_produtos WHERE nome LIKE "%ra";
 
-- Selecionar produtos cujo nome começa com 'ra'
SELECT * FROM tb_produtos WHERE nome LIKE "ra%";
 
-- Verificar a collation atual do banco de dados (forma de comparação de texto)
SELECT @@collation_database;
 
-- Contar o número total de produtos na tabela
SELECT COUNT(*) FROM tb_produtos;
 
-- Contar o número de produtos por categoria
SELECT COUNT(categoria_id) FROM tb_produtos;
 
-- Calcular a média de preço de todos os produtos
SELECT AVG(preco) AS media_preco FROM tb_produtos;
 
-- Calcular a média de preço dos produtos por categoria, formatada em 'R$'
SELECT categoria_id, CONCAT('R$', FORMAT(AVG(preco),2,'pt_BR')) AS media_preco_frutas FROM tb_produtos GROUP BY categoria_id;
 
 
SELECT nome, DATE_FORMAT(dtvalidade,"%d/%m/%Y") AS data_validade FROM tb_produtos;
 
SELECT MAX(preco) AS preco_maximo FROM tb_produtos;
SELECT MIN(preco) AS preco_minimo FROM tb_produtos;
 
-- INNER JOIN
 
SELECT * FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;
 
-- LEFT JOIN
 
SELECT * FROM tb_produtos LEFT JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;
 
-- RIGHT JOIN
 
SELECT * FROM tb_produtos RIGHT JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.descricao
HAVING media_preco > 5;  