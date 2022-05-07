CREATE TABLE tb_Enfermeiro OF tp_Enfermeiro (
    CPF PRIMARY KEY,
    COREN NOT NULL
    

);
/

CREATE TABLE tb_Medico OF tp_Medico (
    CPF PRIMARY KEY,
    CRM NOT NULL
    

);
/

CREATE TABLE tb_Hospital OF tp_Hospital(
    codigo_identificador_hospital PRIMARY KEY 
);
/

CREATE TABLE tb_Paciente OF tp_Paciente(
    CPF PRIMARY KEY

)NESTED TABLE contatos_vinculados STORE AS tb_contatos_vinculados ; 
/


CREATE TABLE tb_Encaminha OF tp_Encaminha(
    
    medico   WITH ROWID REFERENCES  tb_Medico NOT NULL, 
    paciente WITH ROWID REFERENCES  tb_Paciente NOT NULL, 
    hospital WITH ROWID REFERENCES tb_Hospital NOT NULL

);
/

CREATE SEQUENCE codigo_identificador_emergencia INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE codigo_identificador_hospital INCREMENT BY 1 START WITH 1