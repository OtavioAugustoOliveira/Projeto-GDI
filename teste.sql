DECLARE
    medico tp_Medico;
BEGIN
SELECT VALUE(C) INTO medico FROM tp_Medico C WHERE C.cpf = '81287144933';
medico.descrever_medico();
END;