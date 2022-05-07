ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI:SS';

INSERT INTO tb_endereco_Paciente Values (tp_endereco_Paciente('52061-070', 'apt 9091'));

INSERT INTO tb_Paciente Values ( 
    tp_Paciente('01287169500', 'José da Silva','M', TO_DATE('1999-01-01','YYYY-MM-DD'), (SELECT REF(p) FROM tb_endereco_Paciente p WHERE p.CEP = '52061-070') ,VARRAY_tp_telefone(tp_telefone('81999724512','81999322214')))
);


INSERT INTO tb_Hospital Values (tp_Hospital(codigo_identificador_hospital.Nextval, 'João Hora', '93015211', '', '128', 'pediatria', '81999123092'));

INSERT INTO tb_Hospital Values (tp_Hospital(codigo_identificador_hospital.Nextval, 'São Lucas', '329015888', '', '93', 'cardiologia', '81999443088'));

INSERT INTO tb_Hospital Values (tp_Hospital(codigo_identificador_hospital.Nextval, 'Santa Helena', '449112898', '', '27', 'oncologia', '81999397011'));

INSERT INTO tb_Hospital Values (tp_Hospital(codigo_identificador_hospital.Nextval, 'Augusto Franco', '991815381', '', '59', 'traumatologia', '81999841933'));

INSERT INTO tb_Hospital Values (tp_Hospital(codigo_identificador_hospital.Nextval, 'Oswaldo de Souza', '083115777', '', '88', 'neurologia', '81999110099'));

/*    
INSERT INTO Paciente Values ('02915139211', 'Maria do Carmo','F', TO_DATE('1980-11-27','YYYY-MM-DD'), '39145550', 'bloco B 402', '81999319518');

INSERT INTO Paciente Values ('56735839072', 'Glorioso da silva','M', TO_DATE('1985-12-07','YYYY-MM-DD'), '55334970', 'Apt 502', '81990319518');

INSERT INTO Paciente Values ('03625919036', 'Junior capixaba','M', TO_DATE('2000-01-21','YYYY-MM-DD'), '55334970', 'Predio jose bonifacio', '81912319518');

INSERT INTO Paciente Values ('35771882003', 'Jean Carlos','M', TO_DATE('1987-03-12','YYYY-MM-DD'), '39145552', '203', '81111319518');

INSERT INTO Paciente Values ('39040842086', 'Marilene tainha','F', TO_DATE('1911-11-11','YYYY-MM-DD'), '84145550', 'rua sem lugar 2023', '81199419568');

INSERT INTO Paciente Values ('62371634093', 'Welker marcal','M', TO_DATE('2001-11-16','YYYY-MM-DD'), '79145550', 'bloco A 203', '81999319919');

INSERT INTO Paciente Values ('84478227020', 'Robervalda santos','F', TO_DATE('1980-04-05','YYYY-MM-DD'), '59135160', 'bloco B 402', '25119319518');

INSERT INTO Paciente Values ('47449186039', 'Glória maria','F', TO_DATE('1990-09-03','YYYY-MM-DD'), '19145559', 'Apt 1023', '81919319522');

INSERT INTO Paciente Values ('33431694047', 'Benedito josé','M', TO_DATE('2005-01-01','YYYY-MM-DD'), '23145550', 'Apt 402', '81899319110');

INSERT INTO Funcionario Values ('81287138511', '','João Pereira da Gloria',  'medico',TO_DATE('1999-01-28','YYYY-MM-DD'),'81999332211');

INSERT INTO Funcionario Values ('01287138500', '81287138511', 'Josefa Maria da Conceição', 'medico', TO_DATE('1985-09-21','YYYY-MM-DD'), '81999621399');

INSERT INTO Funcionario Values ('01287233599', '01287138500', 'Henrique dos Santos', 'medico', TO_DATE('1970-01-14','YYYY-MM-DD'), '81999711300');

INSERT INTO Funcionario Values ('01287123544', '01287233599', 'Helena Bittencourt dos Anjos', 'medico', TO_DATE('1963-03-08','YYYY-MM-DD'), '81999344300');

INSERT INTO Funcionario Values ('01287111531', '', 'Marcos Cunha da Silva', 'medico', TO_DATE('1953-03-03','YYYY-MM-DD'), '81999143358');

INSERT INTO Funcionario Values ('03245138800',  '81287138511',  'Marcela Rezende Oliveira',  'enfermeiro', TO_DATE('1999-03-11','YYYY-MM-DD'),  '81999444512');

INSERT INTO Funcionario Values ('03492155000',  '03245138800',  'Fernando Iglessias Alves', 'enfermeiro', TO_DATE('1975-01-01','YYYY-MM-DD'), '81999999111');

INSERT INTO Funcionario Values ('33819155083',  '03245138800',  'Maria Iglessias Souza', 'enfermeiro', TO_DATE('1970-02-12','YYYY-MM-DD'), '81999977333');

INSERT INTO Funcionario Values ('03891032550',  '03245138800',  'Marcelo do Pombal Silva', 'enfermeiro', TO_DATE('1993-12-05','YYYY-MM-DD'), '81992188112');

INSERT INTO Funcionario Values ('09931145032',  '03245138800',  'Joana Rezende da Silva', 'enfermeiro', TO_DATE('1973-11-28','YYYY-MM-DD'), '81999833444');

INSERT INTO Funcionario Values ('08846933232',  '',  'Enzo Barreto Queiroz',  'gerente', TO_DATE('1960-09-05','YYYY-MM-DD'),  '81999343819');

INSERT INTO Funcionario Values ('03246133255',  '08846933232',  'João Carmo dos Santos',  'segurança', TO_DATE('1990-01-05','YYYY-MM-DD'),  '81999333211');

INSERT INTO Funcionario Values ('03882159000',  '08846933232',  'Nathan Frederico Rodrigues', 'faxina', TO_DATE('1978-11-03','YYYY-MM-DD'), '81999944012');

INSERT INTO Funcionario Values ('33819121031',  '08846933232',  'Maria Aparecida Santana', 'faxina', TO_DATE('1983-08-05','YYYY-MM-DD'), '81999977111');

INSERT INTO Funcionario Values ('03511032550',  '08846933232',  'Jhonattan Souza dos Santos', 'atendente', TO_DATE('1993-12-05','YYYY-MM-DD'), '81971191112');

INSERT INTO Funcionario Values ('09944145012',  '08846933232',  'Joana Ferreira Aparecida', 'atendente', TO_DATE('1973-04-28','YYYY-MM-DD'), '81999553414');

INSERT INTO Medico Values ('81287138511', '11143219-0/BR');

INSERT INTO Medico Values ('01287138500', '33312989-0/BR');

INSERT INTO Medico Values ('01287233599', '48912381-3/BR');

INSERT INTO Medico Values ('01287123544', '99953929-0/BR');

INSERT INTO Medico Values ('01287111531', '78955933-0/BR');

INSERT INTO Enfermeiro Values ('03245138800', '012.312-PE');

INSERT INTO Enfermeiro Values ('03492155000', '014.190-PE');

INSERT INTO Enfermeiro Values ('33819155083', '392.190-PE');

INSERT INTO Enfermeiro Values ('03891032550', '988.353-PE');

INSERT INTO Enfermeiro Values ('09931145032', '444.392-PE');


INSERT INTO Atendimento Values ('01287169500', '33819155083', TO_TIMESTAMP('2022/03/31 08:14:03','YYYY/MM/DD HH24:MI:SS,'), 'Paciente com febre, pressão 12x8', 'Insira anamnese aqui');

INSERT INTO Atendimento Values ('35771882003', '09931145032', TO_TIMESTAMP('2022/01/21 10:22:08','YYYY/MM/DD HH24:MI:SS,'), 'Descricao do atendimento', 'Insira anamnese aqui');

INSERT INTO Atendimento Values ('39040842086', '03245138800', TO_TIMESTAMP('2021/12/22 01:55:18','YYYY/MM/DD HH24:MI:SS,'), 'Paciente sentindo dores no peito', 'Insira anamnese aqui');

INSERT INTO Atendimento Values ('47449186039', '03245138800', TO_TIMESTAMP('2022/01/31 02:31:28','YYYY/MM/DD HH24:MI:SS,'), 'Suspeita de dengue', 'Insira anamnese aqui');

INSERT INTO Atendimento Values ('33431694047', '03492155000', TO_TIMESTAMP('2021/10/27 19:11:39','YYYY/MM/DD HH24:MI:SS,'), 'Sintomas da gripe', 'Insira anamnese aqui');

INSERT INTO Atendimento Values ('84478227020', '03245138800', TO_TIMESTAMP('2022/03/31 13:55:35','YYYY/MM/DD HH24:MI:SS,'), 'Braço quebrado', 'Insira anamnese aqui');

INSERT INTO Atendimento Values ('02915139211', '03492155000', TO_TIMESTAMP('2022/03/31 23:32:59','YYYY/MM/DD HH24:MI:SS,'), 'Paciente com fortes dores de cabeça', 'Insira anamnese aqui');

INSERT INTO Emergencia Values (codigo_identificador_emergencia.Nextval, '01287169500', '33819155083', 'Perfuração do Pulmão', '31', 'Sobreviveu com sequelas', TO_TIMESTAMP('2022/03/31 03:15:38','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Emergencia Values (codigo_identificador_emergencia.Nextval, '39040842086', '03245138800', 'Infarto', '12', 'Óbito', TO_TIMESTAMP('2022/01/22 11:09:14','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Emergencia Values (codigo_identificador_emergencia.Nextval, '02915139211', '03492155000', 'Problemas respiratorios', '11', 'Alta', TO_TIMESTAMP('2021/02/11 06:28:03','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Emergencia Values (codigo_identificador_emergencia.Nextval, '35771882003', '09931145032', 'Desmaio', '02', 'Em coma induzido', TO_TIMESTAMP('2022/03/31 14:09:58','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Contato_de_Emergencia Values ('02915139211', 'Luiz Henrique da Silva', '81999123399');

INSERT INTO Contato_de_Emergencia Values ('33431694047', 'Jose alberto cardoso', '81193123399');

INSERT INTO Contato_de_Emergencia Values ('47449186039', 'Mario silva sauro', '81999111399');

INSERT INTO Contato_de_Emergencia Values ('03625919036', 'Bosnio florenzi', '81999081399');

INSERT INTO Contato_de_Emergencia Values ('01287169500', 'Carambite jobson', '81999003399');

INSERT INTO Examina Values ('01287138500', '01287169500', 'Sopro no Coração', TO_TIMESTAMP('2022/03/31 12:03:59','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Examina Values ('01287138500', '03625919036', 'Coronavirus', TO_TIMESTAMP('2022/01/22 02:53:00','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Examina Values ('81287138511', '33431694047', 'Infarto', TO_TIMESTAMP('2022/02/25 09:23:18','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Examina Values ('81287138511', '47449186039', 'Infecção intestinal', TO_TIMESTAMP('2022/01/01 01:57:17','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Examina Values ('01287138500', '56735839072', 'Fratura no ombro', TO_TIMESTAMP('2022/03/31 11:04:56','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Encaminha Values ('81287138511', '01287169500', '1', TO_TIMESTAMP('2022/03/29 14:27:46','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Encaminha Values ('81287138511', '33431694047', '2', TO_TIMESTAMP('2022/03/29 19:18:27','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Encaminha Values ('01287138500', '56735839072', '4', TO_TIMESTAMP('2022/03/29 05:02:53','YYYY/MM/DD HH24:MI:SS'));

INSERT INTO Especializacao Values ('81287138511', 'medico');

INSERT INTO Especializacao Values ('01287138500', 'medico');

INSERT INTO Especializacao Values ('01287233599', 'medico');

INSERT INTO Especializacao Values ('01287123544', 'medico');

INSERT INTO Especializacao Values ('01287111531', 'medico');

INSERT INTO Especializacao Values ('03245138800', 'enfermeiro');

INSERT INTO Especializacao Values ('01287138500', 'enfermeiro');

INSERT INTO Especializacao Values ('33819155083', 'enfermeiro');

INSERT INTO Especializacao Values ('03891032550', 'enfermeiro');

INSERT INTO Especializacao Values ('09931145032', 'enfermeiro');

/*