-- Criar Banco de dados 

CREATE DATABASE  db_farmacia_bem_estar;

-- Definindo uso Db

USE db_farmacia_bem_estar;


-- Criar Tabela Categorias

CREATE TABLE tb_categorias(
id BIGINT auto_increment ,
tipo varchar(255) not null,
descricao varchar(255), 
primary key(id)
);

insert into tb_categorias (tipo,descricao) values("Controlados","Somente Com Receita");
insert into tb_categorias (tipo,descricao) values("Charopes","Bom para garganta");
insert into tb_categorias (tipo,descricao) values("Comprimidos","Variados");
insert into tb_categorias (tipo,descricao) values("Cosmedicos","Comedicos em geral");
insert into tb_categorias (tipo,descricao) values("Vitaminas","Vitaminas em geral");



-- Visualizar tb_categorias

select * from tb_categorias; 


-- Criar Tabela Produtos
CREATE TABLE tb_produtos(
id BIGINT auto_increment ,
nome varchar(255) not null,
preco varchar(255) not null, 
quantidade int ,
data_fabricacao date not null,
id_categorias bigint,
primary key(id),

foreign key (id_categorias) references tb_categorias(id)

);


insert into tb_produtos (nome,preco,quantidade,data_fabricacao,id_categorias) values("Ritalina10Ml",49.9,10,"1996-02-14",1);
insert into tb_produtos (nome,preco,quantidade,data_fabricacao,id_categorias) values("CharopeExpectorante",2.9,1,"2021-02-14",2);
insert into tb_produtos (nome,preco,quantidade,data_fabricacao,id_categorias) values("ComprimidosDeCafeina",2.9,1,"2023-01-17",3);
insert into tb_produtos (nome,preco,quantidade,data_fabricacao,id_categorias) values("Batom",74.0,17,"2021-02-14",4);
insert into tb_produtos (nome,preco,quantidade,data_fabricacao,id_categorias) values("Omega3",74.0,17,"2021-02-14",5);
insert into tb_produtos (nome,preco,quantidade,data_fabricacao,id_categorias) values("Vitamina-B12",74.0,17,"2021-02-14",5);
insert into tb_produtos (nome,preco,quantidade,data_fabricacao,id_categorias) values("Depakene",85.0,17,"2021-02-14",1);



select * from tb_produtos; 


-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.

select * from tb_produtos where preco >50;

-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$5,00 e R$ 60,00.

select * from tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todos os produtos que possuam a letra C no atributo nome
SELECT Nome
FROM tb_produtos
WHERE nome LIKE '%C%';


-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.

SELECT nome, preco, quantidade,data_fabricacao,tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.id_categorias = tb_categorias.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela
-- tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos
-- que pertençam a uma categoria específica (Exemplo: Todes os produtos que
-- pertencem a categoria cosméticos).

SELECT nome, tb_categorias.tipo as categoria	-- Operador AS(alias): serve para dar um "apelido" para um campo durante a exibição do SELECT
FROM tb_produtos 
INNER JOIN tb_categorias
ON tb_produtos.id_categorias = tb_categorias.id
WHERE tb_categorias.tipo = "Comprimidos";


