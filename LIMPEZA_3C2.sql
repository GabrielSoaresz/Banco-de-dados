create database limpeza_3c2;
use limpeza_3c2;

create table produto(
codigo int unsigned auto_increment not null primary key,
nome varchar(80) not null,
categoria varchar(80) not null,
preco float(9,2) not null
)engine=innodb;


create table cliente(
codigo int unsigned auto_increment not null primary key,
nome varchar(80) not null,
endereco varchar(200) not null,
telefone char(15) not null,
status varchar(10) not null,
limite_credito float(9,2) not null
)engine=innodb;

create table pedido(
numero int unsigned auto_increment not null primary key,
data date not null,
quantidade int not null,
produto_codigo_fk int unsigned not null,
cliente_codigo_fk  int unsigned not null,
foreign key (produto_codigo_fk) references produto(codigo),
foreign key (cliente_codigo_fk) references cliente(codigo)
)engine=innodb;

insert into produto values(null,'produto1','sabão',5.50),
(null,'produto2','detergente',1.50),
(null,'produto3','sabonete',0.50);

insert into cliente values(null,'Gabriel','Rua dos macacos','(31) 97254-4837','bom',500.00),
(null,'Fernando','Rua dos peixes','(31) 98492-4567','médio',200.00),
(null,'Lucas','Rua dos xéreus','(31) 91927-5681','ruim',70.00);

insert into pedido values(null,'2022/02/02',15,1,1),
(null,'2022/05/18',10,2,2),
(null,'2022/03/25',5,3,3);

-- Utilizei inner join para mostrar o produto comprado e o codigo do cliente que fez o pedido
select produto.nome, produto.categoria, pedido.cliente_codigo_fk as 'Código do cliente'
from pedido inner join produto
on produto.codigo = pedido.produto_codigo_fk
inner join cliente on cliente.codigo = pedido.cliente_codigo_fk;

-- Utilizei left join para saber o limite de crédito do cliente mesmo que não tenha comprado um produto
select produto.nome,produto.preco,cliente.nome as 'Nome do cliente',cliente.limite_credito as'Crédito do cliente'
from pedido left join cliente 
on cliente.codigo = pedido.cliente_codigo_fk
inner join produto on produto.codigo = pedido.produto_codigo_fk;

-- Utilizei left join para mostrar o status do cliente em relação ao seus pedidos
select cliente.nome, cliente.status as 'Status do cliente',pedido.quantidade as 'Pedidos Feitos'
from pedido left join cliente
on cliente.codigo = pedido.cliente_codigo_fk;