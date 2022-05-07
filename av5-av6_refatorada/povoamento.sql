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
                '088.100-PE'
            )

);

INSERT INTO tb_Enfermeiro VALUES (
            tp_Enfermeiro(
                '68910284900',
                'Carlos meira paz',  
                TO_DATE('1997-03-23','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81939314224'), tp_telefone('81139545011')),
                '100.909-PE'
            )

);

INSERT INTO tb_Enfermeiro VALUES (
            tp_Enfermeiro(
                '99981287122',
                'Pedro Pedrado Pedreira',  
                TO_DATE('1924-01-20','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81979331111'), tp_telefone('81309666511')),
                '123.001-PE'
            )

);

INSERT INTO tb_Enfermeiro VALUES (
            tp_Enfermeiro(
                '81235179990',
                'Julio juniores tumulto',  
                TO_DATE('1988-12-01','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81597331454'), tp_telefone('81149505510')),
                '199.001-PE'
            )

);

INSERT INTO tb_Enfermeiro VALUES (
            tp_Enfermeiro(
                '41287144000',
                'Rubinha marisvalda',  
                TO_DATE('1977-08-10','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81479031144'), tp_telefone('81999000011')),
                '112.112-PE'
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

INSERT INTO tb_Medico VALUES (
            tp_Medico(
                '83089187434',
                'Rosa Virgínia',  
                TO_DATE('1988-01-10','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81988110898'), tp_telefone('81988112511')),
                '99951234-0/BR'
            )

);

INSERT INTO tb_Medico VALUES (
            tp_Medico(
                '01327455340',
                'José Ayrton',  
                TO_DATE('1949-05-23','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81944334444'), tp_telefone('81999544511')),
                '12345678-0/BR'
            )

);

INSERT INTO tb_Medico VALUES (
            tp_Medico(
                '01327454211',
                'Stephen Strange',  
                TO_DATE('1930-12-25','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81944334444'), tp_telefone('81999544511')),
                '99123456-1/BR'
            )

);

INSERT INTO tb_Medico VALUES (
            tp_Medico(
                '81726319815',
                'Francisco Sampaio',  
                TO_DATE('1936-01-22','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81944334444'), tp_telefone('81999544511')),
                '99112456-1/BR'
            )

);

INSERT INTO tb_Medico VALUES (
            tp_Medico(
                '85735856275',
                'Pedro Queiroz',  
                TO_DATE('2001-01-22','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81944334444'), tp_telefone('81999544511')),
                '99112123-1/BR'
            )

);

INSERT INTO tb_Medico VALUES (
            tp_Medico(
                '12335856321',
                'Rivelliny',  
                TO_DATE('2001-01-22','YYYY-MM-DD'),
                VARRAY_TP_telefone(tp_telefone('81944334444'), tp_telefone('81999544511')),
                '99115422-4/BR'
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


INSERT INTO tb_Hospital Values (
            tp_Hospital(
                codigo_identificador_hospital.Nextval,
                'Pedro amado', 
                tp_endereco('28031380','ao lado do cemiterio', '001'),
                'Geral',
                VARRAY_TP_telefone(tp_telefone('81742332551'), tp_telefone('81597512033'))
                )

);

INSERT INTO tb_Hospital Values (
            tp_Hospital(
                codigo_identificador_hospital.Nextval,
                'Corcovino', 
                tp_endereco('91358680','Ao lado da pracinha', '788'),
                'Hemodinâmica',
                VARRAY_TP_telefone(tp_telefone('81944330000'), tp_telefone('81999522323'))
                )

);

INSERT INTO tb_Hospital Values (
            tp_Hospital(
                codigo_identificador_hospital.Nextval,
                'Amado de Deus', 
                tp_endereco('18234380','Acima do escrivao', '075'),
                'Hemodialise',
                VARRAY_TP_telefone(tp_telefone('81944335151'), tp_telefone('81933522933'))
                )

);

INSERT INTO tb_Hospital Values (
            tp_Hospital(
                codigo_identificador_hospital.Nextval,
                'Hospital da irrigacao', 
                tp_endereco('28018320','', '999'),
                'Pediatria',
                VARRAY_TP_telefone(tp_telefone('81942332525'), tp_telefone('81222522933'))
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
        tp_contato_emergencia_nested(tp_Contato_De_Emergencia(
            'Maria do Carmo',  
            VARRAY_TP_telefone(tp_telefone('81944138529'))
        ))
    )
);

INSERT INTO tb_Paciente VALUES (
    tp_Paciente(
        '02915139211',
        'Maria do Carmo',
        'F',
        TO_DATE('1980-11-27','YYYY-MM-DD'),
        tp_endereco('39145550','bloco B', '402'),
        VARRAY_TP_telefone(tp_telefone('81999319518')),
        tp_contato_emergencia_nested(tp_Contato_De_Emergencia(
            'José da Silva',  
            VARRAY_TP_telefone(tp_telefone('81938284411'))
        ))
    )
);

INSERT INTO tb_Paciente VALUES (
    tp_Paciente(
        '56735839072',
        'Glorioso da silva',
        'M',
        TO_DATE('1985-12-07','YYYY-MM-DD'),
        tp_endereco('55334970', 'Apt 502', '81990319518'),
        VARRAY_TP_telefone(tp_telefone('81999319518')),
        tp_contato_emergencia_nested(tp_Contato_De_Emergencia(
            'Junior capixaba',  
            VARRAY_TP_telefone(tp_telefone('81912319518'))
        ))
    )
);

INSERT INTO tb_Paciente VALUES (
    tp_Paciente(
        '03625919036',
        'Junior capixaba',
        'M',
        TO_DATE('2000-01-21','YYYY-MM-DD'),
        tp_endereco('55334970', 'Predio jose bonifacio'),
        VARRAY_TP_telefone(tp_telefone('81912319518')),
        tp_contato_emergencia_nested(tp_Contato_De_Emergencia(
            'Junior capixaba',  
            VARRAY_TP_telefone(tp_telefone('81912319518'))
        ))
    )
);

INSERT INTO tb_Paciente VALUES (
    tp_Paciente(
        '35771882003',
        'Jean Carlos',
        'M',
        TO_DATE('1987-03-12','YYYY-MM-DD'),
        tp_endereco('55331234', 'Predio', '140'),
        VARRAY_TP_telefone(tp_telefone('81912319518')),
        tp_contato_emergencia_nested(tp_Contato_De_Emergencia(
            'Marilene tainha',  
            VARRAY_TP_telefone(tp_telefone('81199419568'))
        ))
    )
);

INSERT INTO tb_Paciente VALUES (
    tp_Paciente(
        '39040842086',
        'Marilene tainha',
        'F',
        TO_DATE('1911-11-11','YYYY-MM-DD'),
        tp_endereco('84145550', 'rua sem lugar 2023', '421'),
        VARRAY_TP_telefone(tp_telefone('81199419568')),
        tp_contato_emergencia_nested(tp_Contato_De_Emergencia(
            'Welker marcal',  
            VARRAY_TP_telefone(tp_telefone('81999319919'))
        ))
    )
);

INSERT INTO tb_Paciente VALUES (
    tp_Paciente(
        '62371634093',
        'Welker marcal',
        'M',
        TO_DATE('2001-11-16','YYYY-MM-DD'),
        tp_endereco('79145550', 'bloco A 203', '42'),
        VARRAY_TP_telefone(tp_telefone('81999319919')),
        tp_contato_emergencia_nested(tp_Contato_De_Emergencia(
            'Robervalda santos',  
            VARRAY_TP_telefone(tp_telefone('25119319518'))
        ))
    )
);

INSERT INTO tb_Paciente VALUES (
    tp_Paciente(
        '84478227020',
        'Robervalda santos',
        'F',
        TO_DATE('1980-04-05','YYYY-MM-DD'),
        tp_endereco('59135160', 'bloco B 402', '21')
        VARRAY_TP_telefone(tp_telefone('25119319518')),
         tp_contato_emergencia_nested(tp_Contato_De_Emergencia(
            'Glória maria',  
            VARRAY_TP_telefone(tp_telefone('81919319522'))
        ))
    )
);

INSERT INTO tb_Paciente VALUES (
    tp_Paciente(
        '47449186039',
        'Glória maria',
        'F',
        TO_DATE('1990-09-03','YYYY-MM-DD'),
        ('19145559', 'Apt 1023', '12'),
        VARRAY_TP_telefone(tp_telefone('81919319522')),
         tp_contato_emergencia_nested(tp_Contato_De_Emergencia(
            'Benedito josé',  
            VARRAY_TP_telefone(tp_telefone('81899319110'))
        ))
    )
);

INSERT INTO tb_Paciente VALUES (
    tp_Paciente(
        '33431694047',
        'Benedito josé',
        'M',
        TO_DATE('2005-01-01','YYYY-MM-DD'),
        tp_endereco('23145550', 'Apt 402', '124')
        VARRAY_TP_telefone(tp_telefone('81899319110')),
         tp_contato_emergencia_nested(tp_Contato_De_Emergencia(
            'Marcos josé',  
            VARRAY_TP_telefone(tp_telefone('8998811211'))
        ))
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