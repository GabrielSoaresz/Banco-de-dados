-- ----------------- TRIGGERS -----------------
-- utilizando uma trigger ap?s atualiza??o de dados (AFTER UPDATE)
/*
SITUA??O:
sempre que houver uma atualiza??o do valor de algum produto, 
o valor antigo e o novo devem ser registrados

COMANDO:

CREATE DEFINER = CURRENT_USER TRIGGER `limpeza`.`produtos_AFTER_UPDATE` AFTER UPDATE ON `produtos` FOR EACH ROW
BEGIN

if NEW.valor <> OLD.valor THEN
insert into historico_prod values
(null,NOW(),NEW.idProd,OLD.valor,NEW.valor);
end if;

END

*/