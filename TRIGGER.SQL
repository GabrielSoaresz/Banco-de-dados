-- ----------------- TRIGGERS -----------------
-- utilizando uma trigger após atualização de dados (AFTER UPDATE)
/*
SITUAÇÃO:
sempre que houver uma atualização do valor de algum produto, 
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