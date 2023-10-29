create database ecommerce;

create table clientes (
	cpf char(11) unique primary key,
  	nome varchar(150)
);

create table vendedores (
	cpf char(11) unique primary key,
  	nome varchar(150)
);

create table categorias (
	id serial primary key,
  	nome varchar(50)
);

create table produtos (
	id serial primary key,
  	nome varchar(100),
  	descricao text,
  	preco integer,
  	quantidade_em_estoque integer,
  	categoria_id integer not null references categorias(id)
);

create table pedidos (
	id serial primary key,
  	valor integer,
  	cliente_cpf char(11) not null references clientes(cpf),
  	vendedor_cpf char(11) not null references vendedores(cpf)
);

create table itens_do_pedido (
	id serial primary key,
  	quantidade integer not null,
  	pedido_id integer not null references pedidos(id),
  	produto_id integer not null references produtos(id)
);

insert into categorias (nome)
values 
('frutas'),
('verduras'),
('massas'),
('bebidas'),
('utilidades');

insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id)
values
('Mamão', 'Rico em vitamina A, potássio e vitamina C', 300, 123, 1),
('Maçã', 'Fonte de potássio e fibras.', 90, 34, 1),
('Cebola', 'Rico em quercetina, antocianinas, vitaminas do complexo B, C.', 50, 76, 2),
('Abacate', 'NÃO CONTÉM GLÚTEN.', 150, 64, 1),
('Tomate', 'Rico em vitaminas A, B e C.', 125, 88, 1),
('Acelga', 'NÃO CONTÉM GLÚTEN.', 235, 13, 2),
('Macarrão parafuso', 'Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais', 690, 5, 3),
('Massa para lasanha', 'Uma reunião de família precisa ter comida boa e muita alegria.', 875, 19, 3),
('Refrigerante coca cola lata', 'Sabor original', 350, 189, 4),
('Refrigerante Pepsi 2l', 'NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO.', 700, 12, 4),
('Cerveja Heineken 600ml', 'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado', 1200, 500, 4),
('Agua mineral sem gás', 'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro.', 130, 478, 4),
('Vassoura', 'Pigmento, matéria sintética e metal.', 2350, 30, 5),
('Saco para lixo', 'Reforçado para garantir mais segurança', 1340, 90, 5),
('Escova dental', 'Faça uma limpeza profunda com a tecnologia inovadora', 1000, 44, 5),
('Balde para lixo 50l', 'Possui tampa e fabricado com material reciclado', 2290, 55, 5),
('Manga', 'Rico em Vitamina A, potássio e vitamina C', 198, 176, 1),
('Uva', 'NÃO CONTÉM GLÚTEN.', 420, 90, 1);

insert into clientes (cpf, nome)
values
('80371350042', 'José Augusto Silva'),
('67642869061', 'Antonio Oliveira'),
('63193310034', 'Ana Rodrigues'),
('75670505018', 'Maria da Conceição');

insert into vendedores (cpf, nome)
values
('82539841031', 'Rodrigo Sampaio'),
('23262546003', 'Beatriz Souza Santos'),
('28007155023', 'Carlos Eduardo');

insert into pedidos (valor, cliente_cpf, vendedor_cpf)
values
(9650, '80371350042', '28007155023');

insert into itens_do_pedido (quantidade, pedido_id, produto_id)
values
(1, 1, 1),
(1, 1, 10),
(6, 1, 11),
(1, 1, 15),
(5, 1, 2);

update produtos 
set quantidade_em_estoque = quantidade_em_estoque - 1
where id = 1;

update produtos 
set quantidade_em_estoque = quantidade_em_estoque - 1
where id = 10;

update produtos 
set quantidade_em_estoque = quantidade_em_estoque - 6
where id = 11;

update produtos 
set quantidade_em_estoque = quantidade_em_estoque - 1
where id = 15;

update produtos 
set quantidade_em_estoque = quantidade_em_estoque - 5
where id = 2;

INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf) VALUES
(6460, '63193310034', '23262546003');

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id) VALUES
(2, 10, 17),
(2, 3, 18),
(2, 5, 1),
(2, 10, 5),
(2, 2, 6);


UPDATE produtos
SET quantidade_em_estoque = 166
WHERE id = 17;

UPDATE produtos
SET quantidade_em_estoque = 87
WHERE id = 18;

UPDATE produtos
SET quantidade_em_estoque = 117
WHERE id = 1;

UPDATE produtos
SET quantidade_em_estoque = 78
WHERE id = 5;

UPDATE produtos
SET quantidade_em_estoque = 11
WHERE id = 6;

INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf) VALUES
(4120, '75670505018', '23262546003');

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id) VALUES
(3, 1, 13),
(3, 6, 12),
(3, 5, 17);


UPDATE produtos
SET quantidade_em_estoque = 29
WHERE id = 13;

UPDATE produtos
SET quantidade_em_estoque = 472
WHERE id = 12;

UPDATE produtos
SET quantidade_em_estoque = 161
WHERE id = 17;


INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf) VALUES
(9370, '75670505018', '82539841031');

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id) VALUES
(4, 1, 16),
(4, 6, 18),
(4, 1, 7),
(4, 3, 1),
(4, 20, 5),
(4, 2, 6);


UPDATE produtos
SET quantidade_em_estoque = 54
WHERE id = 16;

UPDATE produtos
SET quantidade_em_estoque = 81
WHERE id = 18;

UPDATE produtos
SET quantidade_em_estoque = 4
WHERE id = 7;

UPDATE produtos
SET quantidade_em_estoque = 114
WHERE id = 1;

UPDATE produtos
SET quantidade_em_estoque = 58
WHERE id = 5;

UPDATE produtos
SET quantidade_em_estoque = 9
WHERE id = 6;



INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf) VALUES
(8229, '67642869061', '82539841031');

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id) VALUES
(5, 8, 18),
(5, 1, 8),
(5, 3, 17),
(5, 8, 5),
(5, 2, 11);


UPDATE produtos
SET quantidade_em_estoque = 79
WHERE id = 18;

UPDATE produtos
SET quantidade_em_estoque = 18
WHERE id = 8;

UPDATE produtos
SET quantidade_em_estoque = 163
WHERE id = 17;

UPDATE produtos
SET quantidade_em_estoque = 50
WHERE id = 5;

UPDATE produtos
SET quantidade_em_estoque = 492
WHERE id = 11;