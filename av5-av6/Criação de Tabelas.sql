CREATE OR REPLACE TYPE tp_Paciente AS OBJECT ( 
    CPF varchar(24), 
    nome varchar(256), 
    sexo varchar(12), 
    data_de_nascimento date CHECK , 
    cep varchar(24), 
    complemento varchar(32) NULL, 
    telefone varchar(15), 

);


CREATE TABLE tb_Paciente OF tp_Paciente(

    CPF PRIMARY KEY,
    data_de_nascimento (data_de_nascimento > TO_DATE('1880-01-01','YYYY-MM-DD'))
    
)




CREATE TABLE Funcionario ( 
    CPF varchar(24) , 
    cpf_gerente varchar(24) NULL, 
    nome varchar(256), 
    funcao varchar(30), 
    data_de_nascimento date CHECK (data_de_nascimento > TO_DATE('1880-01-01','YYYY-MM-DD')), 
    telefone varchar(15), 
   
    CONSTRAINT PK_Funcionario PRIMARY KEY (CPF), 
    CONSTRAINT FK_cpf_gerente FOREIGN KEY (cpf_gerente) REFERENCES Funcionario(CPF) 
     
 
);

CREATE TABLE Medico ( 
    CPF_med varchar(24) NOT NULL, 
    CRM varchar(24) NOT NULL, 
   
    CONSTRAINT PK_Medico PRIMARY KEY (CPF_med), 
    CONSTRAINT FK_medico_para_funcionario FOREIGN KEY (CPF_med) REFERENCES Funcionario(CPF) 
 
);

CREATE TABLE Enfermeiro ( 
    CPF_func varchar(24) NOT NULL, 
    COREN varchar(24) NOT NULL, 
   
    CONSTRAINT PK_Enfermeiro PRIMARY KEY (CPF_func), 
    CONSTRAINT FK_enfermeiro_para_funcionario FOREIGN KEY (CPF_func) REFERENCES Funcionario(CPF) 
 
);

CREATE TABLE Hospital ( 
    codigo_identificador_hospital varchar(240), 
    nome varchar(256), 
    cep varchar(15), 
    complemento varchar(20) NULL, 
    numero varchar(15), 
    especializacao varchar(15), 
    telefone varchar(15), 
    CONSTRAINT PK_Hospital PRIMARY KEY (codigo_identificador_hospital) 
 
);

CREATE TABLE Atendimento ( 
    paciente varchar(256) NOT NULL, 
    enfermeiro varchar(256) NOT NULL, 
    data_e_hora TIMESTAMP(0), 
    descricao varchar(256), 
    anamnese varchar(256), 
   
    CONSTRAINT PK_Atendimento PRIMARY KEY (paciente,enfermeiro), 
    CONSTRAINT FK_atendimento_para_paciente FOREIGN KEY (paciente) REFERENCES Paciente(CPF), 
    CONSTRAINT FK_atendimento_para_enfermeiro FOREIGN KEY (enfermeiro) REFERENCES Enfermeiro(CPF_func) 
);

CREATE TABLE Emergencia ( 
    codigo_identificador_emergencia varchar(240), 
    paciente varchar(256) NOT NULL, 
    enfermeiro varchar(256) NOT NULL, 
    situacao_inicial varchar(256), 
    numero_da_sala varchar(10), 
    resultado varchar(256), 
    data_e_hora TIMESTAMP(0), 
    
   
    CONSTRAINT PK_Emergencia PRIMARY KEY (codigo_identificador_emergencia), 
    CONSTRAINT FK_Emergencia_para_Atendimento FOREIGN KEY (paciente,enfermeiro) REFERENCES Atendimento(paciente,enfermeiro) 
 
);

CREATE TABLE Contato_de_Emergencia ( 
    CPF_PAC varchar(24) NOT NULL, 
    nome varchar(256), 
    telefone varchar(15), 
   
    CONSTRAINT PK_Contato_de_Emergencia PRIMARY KEY (CPF_PAC,nome), 
    CONSTRAINT FK_contato_para_paciente FOREIGN KEY (CPF_PAC) REFERENCES Paciente(CPF) 
 
);

CREATE TABLE Examina ( 
    medico varchar(256) NOT NULL, 
    paciente varchar(256) NOT NULL, 
    diagnostico varchar(256), 
    data_e_hora TIMESTAMP(0), 
   
    CONSTRAINT PK_Examina PRIMARY KEY (medico,paciente), 
    CONSTRAINT FK_Examina_para_medico FOREIGN KEY (medico) REFERENCES Medico(CPF_med), 
    CONSTRAINT FK_Examina_para_paciente FOREIGN KEY (paciente) REFERENCES Paciente(CPF) 
 
);

CREATE TABLE Encaminha ( 
    medico varchar(256) NOT NULL, 
    paciente varchar(256) NOT NULL, 
    hospital varchar(256) NOT NULL, 
    data_e_hora TIMESTAMP(0), 
   
    CONSTRAINT PK_Encaminha PRIMARY KEY (medico,paciente,hospital,data_e_hora), 
    CONSTRAINT FK_Encaminha_para_medico FOREIGN KEY (medico) REFERENCES Medico(CPF_med), 
    CONSTRAINT FK_Encaminha_para_paciente FOREIGN KEY (paciente) REFERENCES Paciente(CPF), 
    CONSTRAINT FK_Encaminha_para_hospital FOREIGN KEY (hospital) REFERENCES Hospital(codigo_identificador_hospital) 
 
);

CREATE TABLE Especializacao ( 
    funcionario varchar(256) NOT NULL, 
    especializacao varchar(256) NOT NULL, 
     
   
    CONSTRAINT PK_Especializacao PRIMARY KEY (funcionario,especializacao), 
    CONSTRAINT FK_Especializacao_para_funcionario FOREIGN KEY (funcionario) REFERENCES Funcionario(CPF) 
     
 
);

CREATE SEQUENCE codigo_identificador_emergencia INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE codigo_identificador_hospital INCREMENT BY 1 START WITH 1;