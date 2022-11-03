create database turma_3c2;
use turma_3c2;

create table aulas(
id int auto_increment not null primary key,
materia varchar(80) not null
)engine=innodb;

create table professores(
id int auto_increment not null primary key,
nome varchar(80) not null,
email varchar(100) not null,
telefone char(14) not null
)engine=innodb;

create table sala(
id int auto_increment not null primary key,
qtd_alunos int not null
)engine=innodb;

create table turma(
id int auto_increment not null primary key,
nome varchar(10) not null,
periodo varchar(20) not null,
id_aula_fk int not null,
id_sala_fk int not null,
foreign key(id_aula_fk) references aulas(id),
foreign key(id_sala_fk) references sala(id)
)engine=innodb;
select * from turma;

create table turma_professores(
id int auto_increment not null primary key,
id_professor_fk int not null,
id_turma_fk int not null,
foreign key(id_professor_fk) references professores(id),
foreign key(id_turma_fk) references turma(id)
)engine=innodb;

insert into aulas value(null,'Português'),
(null,'Banco de Dados'),
(null,'Matemática');

insert into professores value(null,'Ione','ione@gmail.com.br','(31)948765873'),
(null,'Sameck','sam@gmail.com.br','(31)909832873'),
(null,'Márcia','xereu@gmail.com.br','(31)939058168');

insert into sala value(null,50),
(null,35),
(null,45);

insert into turma value(null,'3C2','3º ano',2,1),
(null,'2D2','2º ano',1,2),
(null,'3A1','3º ano',3,3);

insert into turma_professores values
(null,1,4), 
(null,2,4), 
(null,3,6);

select professores.nome, turma.nome 
from turma_professores right join professores
on professores.id = turma_professores.id_professor_fk
inner join turma
on turma.id = turma_professores.id_turma_fk;

select turma.nome as 'Nome da turma', turma.periodo as 'Ano da Turma', professores.nome
from turma_professores inner join turma
on turma_professores.id_turma_fk = turma.id
inner join professores
on turma_professores.id_professor_fk = professores.id;

