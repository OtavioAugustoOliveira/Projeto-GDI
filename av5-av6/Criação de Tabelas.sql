/* Create table com problema em 2 campos com chave composta, tenho que ajustar as chaves compostas */


CREATE TABLE tb_endereco of tp_endereco(
    cep NOT NULL,
    complemento NULL

);

/

CREATE TABLE tb_Paciente OF tp_Paciente(

    CPF PRIMARY KEY,
    data_de_nascimento CHECK (data_de_nascimento > TO_DATE('1880-01-01','YYYY-MM-DD')),
    endereco SCOPE IS tb_endereco
);
/


CREATE TABLE tb_Funcionario of tp_Funcionario(
    cpf_gerente REFERENCES tb_Funcionario ,
    data_de_nascimento CHECK (data_de_nascimento > TO_DATE('1880-01-01','YYYY-MM-DD')),
    CPF PRIMARY KEY
);
/


CREATE TABLE tb_Medico of tp_Medico(
    CPF_med REFERENCES tb_Funcionario NOT NULL PRIMARY KEY, 
    CRM NOT NULL
    
);
/


CREATE TABLE tb_Enfermeiro OF tp_Enfermeiro (
    CPF_func REFERENCES tb_Funcionario NOT NULL PRIMARY KEY, 
    COREN NOT NULL
    

);
/


CREATE TABLE tb_Hospital OF tp_Hospital(
    codigo_identificador_hospital PRIMARY KEY,
    endereco WITH ROWID REFERENCES tb_endereco
);
/


CREATE TABLE tb_Atendimento OF tp_Atendimento(
    PRIMARY KEY (paciente,enfermeiro),
    paciente REFERENCES tb_Paciente NOT NULL, 
    enfermeiro REFERENCES tb_Enfermeiro NOT NULL 
);
/


CREATE TABLE tb_Emergencia OF tp_Emergencia(
    paciente NOT NULL,
    enfermeiro NOT NULL,
    codigo_identificador_emergencia PRIMARY KEY, 
    (paciente,enfermeiro) REFERENCES tb_Atendimento
);
/


CREATE TABLE tb_Contato_de_Emergencia OF tp_Contato_de_Emergencia (
    CPF_PAC NOT NULL,
    PRIMARY KEY (CPF_PAC,nome)
);
/

CREATE TABLE tb_Examina OF tp_Examina(
    PRIMARY KEY (medico,paciente), 
    medico REFERENCES tb_Medico NOT NULL, 
    paciente REFERENCES tb_Paciente NOT NULL

);
/


CREATE TABLE tb_Encaminha OF tp_Encaminha(
    (medico,paciente,hospital,data_e_hora) PRIMARY KEY ,
    medico  tb_Medico NOT NULL, 
    paciente tb_Paciente NOT NULL, 
    hospital tb_Hospital NOT NULL

);
/


CREATE TABLE tb_Especializacao OF tp_Especializacao (
    especializacao NOT NULL,
    PRIMARY KEY (funcionario,especializacao), 
    funcionario REFERENCES tb_Funcionario NOT NULL
    
);
/

CREATE SEQUENCE codigo_identificador_emergencia INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE codigo_identificador_hospital INCREMENT BY 1 START WITH 1