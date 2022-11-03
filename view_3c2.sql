use turma_3c2;

create view view_professores as select * from professores;
create view view_aulas as select * from aulas;

select * from aulas where id = 2;
create view vw_aulas as select * from aulas where id = 2;
select * from vw_aulas;

show tables;

alter view view_professores as select * from professores where id = 2;
select * from view_professores;