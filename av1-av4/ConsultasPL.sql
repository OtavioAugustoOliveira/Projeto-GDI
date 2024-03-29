-- 2: USO DE ESTRUTURA DE DADOS DO TIPO TABLE
-- Criando uma nova tabela que terá o nome de todos os funcionários

DECLARE
    i BINARY_INTEGER := 0;
    nome_variavel Funcionario.nome%TYPE;
    TYPE TabelaNomes IS TABLE OF Funcionario.nome%TYPE INDEX BY BINARY_INTEGER;
    new_table TabelaNomes;
    CURSOR nomes_cursor IS SELECT nome FROM Funcionario;
BEGIN
     OPEN nomes_cursor;
     
         LOOP
             FETCH nomes_cursor INTO nome_variavel;
             new_table(i) := nome_variavel;
             DBMS_OUTPUT.Put_line(new_table(i));
             i := i+1;
             EXIT WHEN nomes_cursor%NOTFOUND;
         END LOOP;
END;
/
--3: USO DE BLOCO ANÔNIMO
-- Utilizando um bloco anômino para mostrar todos os pacientes 

DECLARE
    iterator BINARY_INTEGER := 0;
    patient_name Paciente.nome%TYPE;
    CURSOR pointer IS SELECT nome FROM Paciente;
BEGIN
    OPEN pointer;
        LOOP
            FETCH pointer INTO patient_name;
            DBMS_OUTPUT.Put_line(patient_name);
            iterator := iterator + 1;
            EXIT WHEN pointer%NOTFOUND;
        END LOOP;
END;
/
/*4 e 16 : Criar procedimento que recebe como parametros dados do paciente, e o insere na tabela de Paciente*/ 

CREATE OR REPLACE PROCEDURE InserePaciente(
  p_CPF Paciente.CPF%TYPE,
  p_nome Paciente.nome%TYPE,
  p_sexo Paciente.sexo%TYPE,
  p_data_de_nascimento Paciente.data_de_nascimento%TYPE,
  p_cep Paciente.cep%TYPE,
  p_complemento Paciente.complemento%TYPE,
  p_telefone Paciente.telefone%TYPE) 
  IS
  BEGIN
    INSERT INTO Paciente (CPF, nome, sexo, data_de_nascimento, cep, complemento, telefone) 
    VALUES (p_CPF, p_nome, p_sexo, p_data_de_nascimento, p_cep, p_complemento, p_telefone);

    COMMIT;
  END InserePaciente;

/
-- 7 : %ROWTYPE
-- Utilizando rowtype para definir uma variável que armazena todos os valores da linha que está sendo lida 

DECLARE
    patient_infos Paciente%ROWTYPE;
BEGIN
    SELECT *
    INTO patient_infos
    FROM Paciente
    WHERE cpf = 01287169500;
    DBMS_OUTPUT.Put_line(patient_infos.nome || ' ' || patient_infos.sexo || ' ' || patient_infos.telefone);
END;
/

/*8 e 12 - FOR IN LOOP e IF ELSIF : Quais funcionários são profissionais de saúde*/ 
BEGIN
    DBMS_OUTPUT.Put_line('Profissionais de saúde cadastrados:');
    FOR funcionario IN (SELECT * FROM Funcionario) LOOP
        IF funcionario.funcao = 'medico' THEN
            DBMS_OUTPUT.Put_line('Médico: ' || funcionario.nome);
        ELSIF funcionario.funcao = 'enfermeiro' THEN
            DBMS_OUTPUT.Put_line('Enfermeiro: ' || funcionario.nome);
        END IF;
    END LOOP;
END;
/


-- 10 LOOP EXIT WHEN
-- Utilizando Exit When para encerrar o loop quando o cursor de diagnósticos tiver percorrido por todos os diagnosticos da tabela de examina
DECLARE
    i BINARY_INTEGER := 0;
    diagnostico_var Examina.diagnostico%TYPE;
    TYPE TabelaDiagnosticos IS TABLE OF Examina.diagnostico%TYPE INDEX BY BINARY_INTEGER;
    new_table TabelaDiagnosticos;
    CURSOR diagnosticos_cursor IS SELECT diagnostico FROM Examina;
BEGIN
     OPEN diagnosticos_cursor;
     
         LOOP
             FETCH diagnosticos_cursor INTO diagnostico_var;
             new_table(i) := diagnostico_var;
             DBMS_OUTPUT.Put_line(new_table(i));
             i := i+1;
             EXIT WHEN diagnosticos_cursor%NOTFOUND;
         END LOOP;
END;
/
-- 15: WHILE LOOP
-- Utilizando While Loop para percorrer todos os pacientes da tabela de pacientes e printar seus nomes

DECLARE 
    iterator BINARY_INTEGER := 0;
    patient_count BINARY_INTEGER := 0;
    patient_name Paciente.nome%TYPE;
    CURSOR pointer IS SELECT nome FROM Paciente;
BEGIN
    OPEN pointer;
        SELECT
        COUNT(*)
        INTO patient_count
        FROM Paciente;
        WHILE iterator < patient_count LOOP
            FETCH pointer INTO patient_name;
            DBMS_OUTPUT.Put_line(patient_name);
            iterator := iterator + 1;
        END LOOP;
END;
/

-- 14 CURSOR (OPEN, FETCH e CLOSE)
-- Criando uma nova tabela de especialização dos hospitais, pegando as informações com o cursor
-- , abrindo ele para ser utilizado, usando fetch para colocar as informações na variável e então fechando-o para liberar espaço
DECLARE
    i BINARY_INTEGER := 0;
    espec_var hospital.Especializacao%TYPE;
    TYPE TabelaEspecs IS TABLE OF hospital.Especializacao%TYPE INDEX BY BINARY_INTEGER;
    new_table TabelaEspecs;
    CURSOR especs_cursor IS SELECT Especializacao FROM Hospital;
BEGIN
     OPEN especs_cursor;
     
         LOOP
             FETCH especs_cursor INTO espec_var;
             new_table(i) := espec_var;
             DBMS_OUTPUT.Put_line(new_table(i));
             i := i+1;
             EXIT WHEN especs_cursor%NOTFOUND;
         END LOOP;
     CLOSE especs_cursor;

END;
/
-- 16: EXCEPTION WHEN
-- Utilizando exception when para tratar o erro de não encontrar um paciente na tabela de pacientes

DECLARE
    patient_info Paciente%ROWTYPE;
BEGIN
    SELECT *
    INTO patient_info
    FROM Paciente
    WHERE cpf = 1;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.Put_line('Não encontrado');
END;
/

--18 CREATE OR REPLACE PACKAGE BODY
-- Criando um package que contem o procedimento de criar paciente, e então fazendo o seu respectivo body

CREATE OR REPLACE PACKAGE paciente_package AS
    PROCEDURE criar_paciente(CPF Paciente.CPF%TYPE, Nome Paciente.NOME%TYPE, Sexo Paciente.SEXO%TYPE,
    DataNas Paciente.DATA_DE_NASCIMENTO%TYPE, CEP Paciente.CEP%TYPE, Complemento Paciente.COMPLEMENTO%TYPE, Tel Paciente.TELEFONE%TYPE);
END paciente_package;
/
CREATE OR REPLACE PACKAGE BODY paciente_package AS
    PROCEDURE criar_paciente(CPF Paciente.CPF%TYPE, Nome Paciente.NOME%TYPE, Sexo Paciente.SEXO%TYPE,
    DataNas Paciente.DATA_DE_NASCIMENTO%TYPE, CEP Paciente.CEP%TYPE, Complemento Paciente.COMPLEMENTO%TYPE, Tel Paciente.TELEFONE%TYPE) IS
    BEGIN 
        INSERT INTO Paciente(CPF, NOME, SEXO, DATA_DE_NASCIMENTO, CEP, COMPLEMENTO, TELEFONE)
            VALUES (CPF, Nome, Sexo, DataNas, CEP, Complemento, Tel);
    END criar_paciente;
END paciente_package;
/

-- 19: CREATE OR REPLACE TRIGGER (COMANDO)
-- Criando um trigger para criar um médico quando um funcionário com o cargo de médico for criado

CREATE OR REPLACE TRIGGER medico_trigger AFTER INSERT ON Funcionario FOR EACH ROW WHEN(NEW.funcao = 'medico')
BEGIN
    INSERT INTO Medico VALUES ('01327455340', '78951234-0/BR');
    DBMS_OUTPUT.PUT_LINE('Médico criado');
END;
/
INSERT INTO Funcionario Values ('01327455340',  '08846933232',  'José Ayrton', 'medico', TO_DATE('1973-04-28','YYYY-MM-DD'), '81999553414');



/*20 - Trigger por linha, levantar erro caso descrição e anamnese sejam iguais em um atendimento */ 

CREATE OR REPLACE TRIGGER contato_emerg_igual BEFORE INSERT ON Atendimento FOR EACH ROW
    BEGIN
    IF :NEW.descricao = :NEW.anamnese THEN
        RAISE_APPLICATION_ERROR(-20000, 'Descrição do atendimento e anamnese não podem ser iguais');
    END IF;
END;
/


/*1: RECORD: criamos um tipo que armazena só cpf e nome dos funcionários*/

DECLARE
    TYPE cpf_nome_func IS RECORD(
        cpf CHAR(11), 
        nome VARCHAR2(255)); 
        novo_func cpf_nome_func;
BEGIN
    novo_func.cpf := '99933200155';
    novo_func.nome := 'Marcos Pereira Silva';
END;

/

/*5: Function: Função que retorna a data de nascimento se o  funcionario nasceu depois de 1990: */

CREATE OR REPLACE FUNCTION return_data_nascimento(CPF_func Funcionario.CPF%TYPE)

RETURN date

IS
    nascimento_func Funcionario.data_de_nascimento%TYPE;
    output  Funcionario.CPF%TYPE;

BEGIN

SELECT data_de_nascimento INTO nascimento_func from Funcionario where Funcionario.CPF = CPF_func and data_de_nascimento >= TO_DATE('1990-01-01','YYYY-MM-DD');

output := nascimento_func;

RETURN output;

END return_data_nascimento;


/



/*9: CASE WHEN: Irá retornar
'1' caso o cpf do paciente comece com 1 ou 2, 
'2' caso o cpf do paciente comece com 3 ou 4, 
'3' caso o cpf do paciente comece com 5 ou 6
'4' caso o cpf do paciente comece com 7 ou 8
'5' caso o cpf do paciente comece com 9 ou 0
*/

DECLARE

variavel_cpf VARCHAR(12) := '01287169500';
primeira_letra_variavel VARCHAR(1);
parametrizacao_cpf VARCHAR(1);

BEGIN

SELECT SUBSTR(variavel_cpf,1,1) AS primeira_letra into primeira_letra_variavel FROM Paciente WHERE Paciente.CPF = variavel_cpf;

CASE primeira_letra_variavel

WHEN '1'  THEN parametrizacao_cpf := '1';
WHEN '2'  THEN parametrizacao_cpf := '1';
WHEN '3'  THEN parametrizacao_cpf := '2';
WHEN '4'  THEN parametrizacao_cpf := '2';
WHEN '5'  THEN parametrizacao_cpf := '3';
WHEN '6'  THEN parametrizacao_cpf := '3';
WHEN '7'  THEN parametrizacao_cpf := '4';
WHEN '8'  THEN parametrizacao_cpf := '4';
WHEN '9'  THEN parametrizacao_cpf := '5';
WHEN '0'  THEN parametrizacao_cpf := '5';


END CASE;

DBMS_OUTPUT.PUT_LINE(parametrizacao_cpf);

END;
/

/*13. SELECT INTO: Retorna algum comentário a depender do hospital escolhido para atendimento*/
DECLARE
    codigo_hospital varchar(1) := '2';
    nome_hospital VARCHAR(80);
    comentario VARCHAR(50);
BEGIN
    SELECT nome into nome_hospital from Hospital where Hospital.codigo_identificador_hospital = codigo_hospital;

   CASE codigo_hospital

WHEN '1' THEN comentario := 'Muito bem cuidado';
WHEN '2' THEN comentario := 'Funcionários mal educados';
WHEN '3' THEN comentario := 'Péssimo atendimento';
WHEN '4' THEN comentario := 'Bem completo, ótimos equipamentos';
WHEN '5' THEN comentario := 'Faltam equipamentos';

END CASE;
DBMS_OUTPUT.PUT_LINE(comentario);
END;

/

/*17. CREATE OR REPLACE PACKAGE: CRIA UM PACKAGE PARA INSERIR VALORES DE ATENDIMENTO E PACIENTE*/

CREATE OR REPLACE PACKAGE inserção AS 

PROCEDURE inserir_atendimento(novo_valor_atendimento Atendimento%ROWTYPE);
PROCEDURE inserir_paciente(novo_valor_paciente Paciente%ROWTYPE);

END inserção; 
/

CREATE OR REPLACE PACKAGE BODY inserção AS

PROCEDURE inserir_atendimento(novo_valor_atendimento Atendimento%ROWTYPE) IS
BEGIN
INSERT INTO Atendimento(paciente, enfermeiro, data_e_hora, descricao, anamnese) VALUES 
(novo_valor_atendimento.paciente, novo_valor_atendimento.enfermeiro, novo_valor_atendimento.data_e_hora, 
novo_valor_atendimento.descricao, novo_valor_atendimento.anamnese);

END inserir_atendimento;

PROCEDURE inserir_paciente(novo_valor_paciente Paciente%ROWTYPE) IS
BEGIN
INSERT INTO Paciente(CPF, nome, sexo, data_de_nascimento, cep,complemento,telefone) VALUES
(novo_valor_paciente.CPF,novo_valor_paciente.nome,novo_valor_paciente.sexo,novo_valor_paciente.data_de_nascimento,novo_valor_paciente.cep,novo_valor_paciente.complemento,novo_valor_paciente.telefone);

END inserir_paciente;

END inserção;
/

/* 6: %TYPE
-- Utilizando type para definir uma variável do tipo funcao e criando uma tabela com isso */
DECLARE
    i BINARY_INTEGER := 0;
    funcao_var Funcionario.funcao%TYPE;
    TYPE TabelaFuncoes IS TABLE OF Funcionario.funcao%TYPE INDEX BY BINARY_INTEGER;
    new_table TabelaFuncoes;
    CURSOR funcoes_cursor IS SELECT funcao FROM Funcionario;
BEGIN
     OPEN funcoes_cursor;
     
         LOOP
             FETCH funcoes_cursor INTO funcao_var;
             new_table(i) := funcao_var;
             DBMS_OUTPUT.Put_line(new_table(i));
             i := i+1;
             EXIT WHEN funcoes_cursor%NOTFOUND;
         END LOOP;
END;
























-- INSERT INTO Atendimento Values ('01287169500', '33819155083', TO_TIMESTAMP('2022/03/31 08:14:03','YYYY/MM/DD HH24:MI:SS,'), 'Paciente com febre, pressão 12x8', 'Paciente com febre, pressão 12x8');
