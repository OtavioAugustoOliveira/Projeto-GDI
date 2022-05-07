 /* Checklist AV5
-1. CREATE OR REPLACE TYPE - ✅
-2. CREATE OR REPLACE TYPE BODY - 
-3. MEMBER PROCEDURE - 
-4. MEMBER FUNCTION - 
-5. ORDER MEMBER FUNCTION - 
-6. MAP MEMBER FUNCTION -
-7. CONSTRUCTOR FUNCTION - 
-8. OVERRIDING MEMBER - 
-9. FINAL MEMBER - 
-10. NOT INSTANTIABLE TYPE/MEMBER - ✅
-11. HERANÇA DE TIPOS (UNDER/NOT FINAL) - ✅
-12. ALTER TYPE - ✅
-13. CREATE TABLE OF - ✅
-14. WITH ROWID REFERENCES - ✅
-15. REF - ✅
-16. SCOPE IS - 
-17. INSERT INTO - ✅
-18. VALUE - 
-19. VARRAY - ✅
-20. NESTED TABLE  ✅

*/



CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    cep varchar(24),
    complemento varchar(24),
    numero varchar(24)
    
);
/


CREATE OR REPLACE TYPE tp_telefone AS OBJECT (

    numero VARCHAR2 (15)

);
/


CREATE OR REPLACE TYPE VARRAY_TP_telefone AS VARRAY (3) OF tp_telefone;
/


CREATE OR REPLACE TYPE tp_Contato_De_Emergencia AS OBJECT (  
    nome varchar(256),
    telefone VARRAY_tp_telefone
  
);
/

CREATE OR REPLACE TYPE tp_contato_emergencia_nested AS TABLE OF tp_Contato_De_Emergencia;
/





CREATE OR REPLACE TYPE tp_Funcionario AS OBJECT ( 
    CPF varchar(24), 
    nome varchar(256),  
    data_de_nascimento date
 
) NOT FINAL NOT INSTANTIABLE;
/

ALTER TYPE tp_Funcionario
    ADD ATTRIBUTE (telefone VARRAY_tp_telefone)
    CASCADE;

/

CREATE OR REPLACE TYPE tp_Medico UNDER tp_Funcionario  ( 
    CRM varchar(24)
);
/

CREATE OR REPLACE TYPE tp_Enfermeiro UNDER tp_Funcionario  ( 
    COREN varchar(24)
);
/

CREATE OR REPLACE TYPE tp_Paciente AS OBJECT ( 
    CPF varchar(24), 
    nome varchar(256), 
    sexo varchar(12), 
    data_de_nascimento date,  
    endereco tp_endereco,
    telefone VARRAY_tp_telefone,
    contatos_vinculados  tp_contato_emergencia_nested

);
/

CREATE OR REPLACE TYPE tp_Hospital AS OBJECT  ( 
    codigo_identificador_hospital INTEGER,
    nome varchar(256),
    endereco tp_endereco,
    especializacao varchar(15), 
    telefone VARRAY_tp_telefone
);
/

CREATE OR REPLACE TYPE tp_Encaminha AS OBJECT (  
    medico REF tp_Medico, 
    paciente REF tp_Paciente, 
    hospital REF tp_Hospital, 
    data_e_hora TIMESTAMP(0)
  
);
/

