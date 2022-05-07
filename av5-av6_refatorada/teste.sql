DECLARE
    medico tp_Medico;
BEGIN
SELECT VALUE(C) INTO medico FROM tb_Medico C WHERE C.cpf = '81287144933';
medico.descrever_funcionario();
END;
/


DECLARE
    hospital tp_Hospital;
BEGIN
SELECT VALUE(C) INTO hospital FROM tb_Hospital C WHERE C.codigo_identificador_hospital = 1;
hospital.retorna_incremento_id_hospital();
END;



