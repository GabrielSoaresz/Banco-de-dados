create database loja_procedure;
use loja_procedure;

create table pedidos(
idpedidos int auto_increment not null primary key,
nome_cliente varchar(80) not null,
dt_pedido timestamp not null,
total_pedido decimal(9,2) not null
)engine=innodb;

create table produtos(
idprodutos int auto_increment not null primary key,
nome varchar(80) not null,
quantidade int not null,
valor decimal(9,2)
)engine=innodb;

create table itens_pedidos(
iditens int unsigned auto_increment not null primary key,
quantidade int not null,
valor_unitario decimal(9,2) not null,
produtos_idprodutos int not null,
pedidos_idpedidos int not null,
foreign key(produtos_idprodutos) references produtos(idprodutos),
foreign key(pedidos_idpedidos) references pedidos(idpedidos)
)engine=innodb;

insert into pedidos values(null,'Cliente A',now(),150),
(null,'Cliente B',now(),75),
(null,'Cliente C',now(),50);

insert into produtos values (null,'Produto A',200,10),
(null,'Produto B',50,25),
(null,'Produto C',100,10);

insert into itens_pedidos values(null,15,10,1,1),
(null,5,10,3,3),
(null,3,25,2,2);

select * from produtos;
delimiter $$
create procedure pr_baixaestoque(
in ncodigo int,
in nquantidade int
)
begin
update produtos
set produtos.quantidade = produtos.quantidade - nquantidade
where produtos.idprodutos = ncodigo;
end
$$
call pr_baixaestoque(1,2);

delimiter $$
create procedure pr_totalizarpedidos(
in npedido int,
ntotal decimal(10,2)
)
begin
select sum (itens_pedidos.quantidade * itens_pedidos.valor_unitario) into ntotal
from produtos_pedidos itens_pedidos
where itens_pedidos.pedidos_idpedidos = npedido;

end
$$
select * from pedidos;