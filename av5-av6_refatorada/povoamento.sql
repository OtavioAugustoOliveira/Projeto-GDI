ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI';



INSERT INTO tb_Enfermeiro VALUES (
            tp_Enfermeiro(
                '81287138511',
                'João Pereira da Gloria',  
                TO_DATE('1999-01-28','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81999332211'), tp_telefone('81999449911')),
                '012.312-PE'
            )

);


INSERT INTO tb_Enfermeiro VALUES (
            tp_Enfermeiro(
                '81287144999',
                'João Marciel Lott',  
                TO_DATE('2005-03-23','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81999334444'), tp_telefone('81999555511')),
                '094.112-PE'
            )

);

INSERT INTO tb_Medico VALUES (
            tp_Medico(
                '81287144933',
                'João Marciel',  
                TO_DATE('2001-09-23','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81944334444'), tp_telefone('81999544511')),
                '99953929-0/BR'
            )

);


INSERT INTO tb_Hospital Values (
            tp_Hospital(
                codigo_identificador_hospital.Nextval,
                'João Silva', 
                tp_endereco('58012345','Apartamento', '75'),
                'Cardiologia',
                VARRAY_TP_telefone(tp_telefone('81944335555'), tp_telefone('81999522933'))
                )

);

INSERT INTO tb_Hospital Values (
            tp_Hospital(
                codigo_identificador_hospital.Nextval,
                'João Hora', 
                tp_endereco('58038380','Casa', '175'),
                'Pediatria',
                VARRAY_TP_telefone(tp_telefone('81944335555'), tp_telefone('81999522933'))
                )

);

INSERT INTO tb_Paciente Values( 
            tp_Paciente(
            '01287169500', 
            'José da Silva',
            'M',
            TO_DATE('1999-01-01','YYYY-MM-DD'), 
            tp_endereco('58038444','Casa', '128'),
            VARRAY_TP_telefone(tp_telefone('81938284411')),
            tp_contato_emergencia_nested 
            ( tp_Contato_De_Emergencia('Maria do Carmo',  
            VARRAY_TP_telefone(tp_telefone('81944138529'))) )
            )
);

INSERT INTO tb_Encaminha VALUES (
    tp_Encaminha(
        
        (SELECT REF(C) FROM tb_Medico C WHERE C.cpf = '81287144933'),
        (SELECT REF(Cr) FROM tb_Paciente Cr WHERE Cr.cpf = '01287169500'),
        (SELECT REF(G) FROM tb_Hospital G WHERE G.codigo_identificador_hospital = 1 ),
        (TO_DATE('2022-05-05 10:00:00', 'yyyy-mm-dd hh24:mi:ss'))
    )
);

SELECT data_e_hora ,DEREF(PC.medico).nome, (PC.paciente).nome, (PC.hospital).nome FROM tb_Encaminha PC;