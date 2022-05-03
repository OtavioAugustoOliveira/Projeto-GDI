/* 
1. CREATE OR REPLACE TYPE - ✅
2. CREATE OR REPLACE TYPE BODY - ✅
3. MEMBER PROCEDURE - ✅
4. MEMBER FUNCTION - ✅
5. ORDER MEMBER FUNCTION - ✅
6. MAP MEMBER FUNCTION - ✅
7. CONSTRUCTOR FUNCTION - ✅
8. OVERRIDING MEMBER - ✅
9. FINAL MEMBER - ✅
10. NOT INSTANTIABLE TYPE/MEMBER - preciso adaptar para que a gente não possa criar um objeto do tipo, 
somente filhos. Ex: funcionario receber apenas enfermeiro e médico.
11. HERANÇA DE TIPOS (UNDER/NOT FINAL) - ✅
12. ALTER TYPE - ✅
13. CREATE TABLE OF - ✅
14. WITH ROWID REFERENCES
15. REF
16. SCOPE IS
17. INSERT INTO -✅
18. VALUE
19. VARRAY
20. NESTED TABLE




 */






CREATE OR REPLACE TYPE tp_Paciente AS OBJECT ( 
    CPF varchar(24), 
    nome varchar(256), 
    sexo varchar(12), 
    data_de_nascimento date , 
    cep varchar(24), 
    complemento varchar(32) NULL, 
    telefone varchar(15),
    MAP MEMBER FUNCTION retorna_paciente RETURN varchar2

);
/

CREATE OR REPLACE TYPE BODY tp_Paciente AS 
MAP MEMBER FUNCTION retorna_paciente RETURN varchar2
    IS
    BEGIN
     RETURN ('CPF:'   || CPF ||
            ', nome:' || nome ||
            ', sexo:'  || sexo);

        END;
    
    
    END;

/


CREATE OR REPLACE TYPE tp_Funcionario AS OBJECT ( 
    CPF varchar(24) , 
    cpf_gerente varchar(24), 
    nome varchar(256), 
    funcao varchar(30), 
    data_de_nascimento date,
    
    MEMBER PROCEDURE descrever_funcionario
 
) NOT FINAL;
/

CREATE OR REPLACE TYPE BODY tp_Funcionario AS
MEMBER PROCEDURE descrever_funcionario IS

BEGIN
    DBMS_OUTPUT.PUT_LINE('Descrevendo Funcionario:');
    DBMS_OUTPUT.PUT_LINE('CPF:' || CPF);
    DBMS_OUTPUT.PUT_LINE('CPF do Gerente:' || cpf_gerente);
    DBMS_OUTPUT.PUT_LINE('Nome:' || nome);

    END;
END;

/


ALTER TYPE tp_Funcionario
    ADD ATTRIBUTE (telefone varchar(15))
    CASCADE;

/


CREATE OR REPLACE TYPE tp_Medico UNDER tp_Funcionario  ( 
    CPF_med varchar(24), 
    CRM varchar(24),
    OVERRIDING MEMBER PROCEDURE descrever_funcionario
   
);
/

CREATE OR REPLACE TYPE BODY tp_Medico AS
OVERRIDING MEMBER PROCEDURE descrever_funcionario IS

BEGIN
    DBMS_OUTPUT.PUT_LINE('Descrevendo Funcionario:');
    DBMS_OUTPUT.PUT_LINE('CPF:' || CPF);
    DBMS_OUTPUT.PUT_LINE('CPF do Gerente:' || cpf_gerente);
    DBMS_OUTPUT.PUT_LINE('Nome:' || nome);
    DBMS_OUTPUT.PUT_LINE('funcao:' || funcao);


    END;
END;

/


CREATE OR REPLACE TYPE tp_Enfermeiro UNDER tp_Funcionario  ( 
    CPF_func varchar(24), 
    COREN varchar(24)
);
/

CREATE OR REPLACE TYPE tp_Hospital AS OBJECT  ( 
    codigo_identificador_hospital varchar(240), 
    nome varchar(256), 
    cep varchar(15), 
    complemento varchar(20), 
    numero varchar(15), 
    especializacao varchar(15), 
    telefone varchar(15),
    FINAL MEMBER FUNCTION retorna_nome_hospital RETURN varchar
);
/

CREATE OR REPLACE TYPE BODY tp_Hospital AS 

FINAL MEMBER FUNCTION retorna_nome_hospital RETURN varchar IS
    BEGIN
        RETURN nome;
    END;
END;
/

CREATE OR REPLACE TYPE tp_Atendimento AS OBJECT ( 
    paciente varchar(256), 
    enfermeiro varchar(256), 
    data_e_hora TIMESTAMP(0), 
    descricao varchar(256), 
    anamnese varchar(256)
   
);
/

CREATE OR REPLACE TYPE tp_Emergencia AS OBJECT (  
    codigo_identificador_emergencia varchar(240), 
    paciente varchar(256), 
    enfermeiro varchar(256), 
    situacao_inicial varchar(256), 
    numero_da_sala varchar(10), 
    resultado varchar(256), 
    data_e_hora TIMESTAMP(0),
    ORDER MEMBER FUNCTION func_compara_data_e_hora (objeto tp_Emergencia) RETURN NUMBER
    
);
/

CREATE OR REPLACE TYPE BODY tp_Emergencia AS 
    ORDER MEMBER FUNCTION func_compara_data_e_hora (objeto tp_Emergencia) RETURN NUMBER IS
    BEGIN
        IF SELF.data_e_hora < objeto.data_e_hora THEN
            RETURN -1;
        
        ELSIF SELF.data_e_hora > objeto.data_e_hora THEN
            RETURN 1;

        ELSE
            RETURN 0;
        END IF;

    END;
END;

/


CREATE OR REPLACE TYPE tp_Contato_de_Emergencia AS OBJECT  ( 
    CPF_PAC varchar(24), 
    nome varchar(256), 
    telefone varchar(15),
   CONSTRUCTOR FUNCTION tp_Contato_de_Emergencia (objeto tp_Contato_de_Emergencia) RETURN SELF AS RESULT 
);
/


CREATE OR REPLACE TYPE BODY tp_Contato_de_Emergencia AS 
CONSTRUCTOR FUNCTION tp_Contato_de_Emergencia (objeto tp_Contato_de_Emergencia) RETURN SELF AS RESULT IS
BEGIN
    CPF_PAC := objeto.CPF_PAC;
    nome := objeto.nome;
    telefone := objeto.telefone;

    RETURN;
    END;
END;
/


CREATE OR REPLACE TYPE tp_Examina AS OBJECT ( 
    medico varchar(256), 
    paciente varchar(256), 
    diagnostico varchar(256), 
    data_e_hora TIMESTAMP(0)
   

 
);
/

CREATE OR REPLACE TYPE tp_Encaminha AS OBJECT (  
        medico varchar(256), 
        paciente varchar(256), 
        hospital varchar(256), 
        data_e_hora TIMESTAMP(0)
 
 
);
/

CREATE OR REPLACE TYPE tp_Especializacao AS OBJECT ( 
    funcionario varchar(256), 
    especializacao varchar(256)
     
 
);
/