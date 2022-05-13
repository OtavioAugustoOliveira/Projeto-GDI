/* selecionar todos os médicos que começam com cpf 8 ou  cujo nome termina com n */

SELECT CPF,NOME FROM tb_Medico WHERE CPF LIKE '8%' or NOME LIKE '%n';
/

/* selecionar todos os pacientes nascidos em 1990 ou adiante */
SELECT * FROM tb_Paciente where DATA_DE_NASCIMENTO >= TO_DATE('1990-01-01', 'YYYY-MM-DD');
/

/* seleciona os hospitais cujo codigo identificador é 1, 3 ou 5*/
SELECT * FROM tb_Hospital where codigo_identificador_hospital IN (1,3,5);
/

/* pega o registro do nome de pacientes encaminhados, 
do nome do médico responsável pelo encaminhamento 
e o nome do hospital ao qual foram encaminhados*/

SELECT DEREF(D.medico).nome, DEREF(D.paciente).nome, DEREF(D.hospital).nome 
FROM tb_Encaminha D;
/

/* Retorna cpf, nome, sexo, data_de_nascimento e informações sobre o 
endereço de todos que moram em condominios (apto ou predio) */

SELECT cpf, nome, sexo, data_de_nascimento, (D.ENDERECO).cep,(D.ENDERECO).complemento, 
(D.ENDERECO).numero FROM tb_Paciente D WHERE (D.ENDERECO).complemento like 'Apt%' 
or (D.ENDERECO).complemento like 'Predio%';
/

/* retorna a quantidade de homens e mulheres na tabela de pacientes */
SELECT COUNT(*),sexo from tb_Paciente group by sexo;
/

/* retorna cpf e coren dos enfermeiros */
SELECT NOME, COREN FROM tb_Enfermeiro;
/

/* retorna a quantidade e o nome dos médicos que examinaram alguém */
SELECT count(*), DEREF(D.medico).nome FROM tb_Examina D group by DEREF(D.medico).nome;
/

/* Retorna nome do paciente, numero do paciente, nome do seu contato de emergencia e numero do contato de emergencia
OBS: CONSULTA DE VARRAY DENTRO DE NESTED TABLE*/
SELECT P.nome as paciente, H.numero as numero_paciente, C.nome as nome_contato_emergencia, T.numero as numero_contato_emergencia 
FROM tb_Paciente P , TABLE(P.contatos_vinculados) C, TABLE(C.telefone) T, TABLE(P.telefone) H;
/

/* retorna nome do paciente, numero do paciente, nome do contato de emergencia e numero do contato de emergencia
de pacientes cujo contato de emergencia é compartilhado com outras pessoas
OBS: CONSULTA DE VARRAY DENTRO DE NESTED TABLE com group by e order by*/


SELECT P.nome as paciente, H.numero as numero_paciente, C.nome as nome_contato_emergencia, T.numero as numero_contato_emergencia 
FROM tb_Paciente P , TABLE(P.contatos_vinculados) C, TABLE(C.telefone) T, TABLE(P.telefone) H 
WHERE T.numero in (

SELECT numero_contato_emergencia FROM (SELECT count(*) as quantidade_repeticoes, T.numero as numero_contato_emergencia
FROM tb_Paciente P , TABLE(P.contatos_vinculados) C, TABLE(C.telefone) T, TABLE(P.telefone) H 
GROUP BY T.numero)
WHERE quantidade_repeticoes > 1)
order by P.nome DESC;
/

/* retorna nome do medico, do paciente, diagnostico e data dos exames,
 da ordem do mais antigo para o mais atual */
SELECT DEREF(E.medico).nome, DEREF(E.paciente).nome, diagnostico, data_e_hora FROM tb_Examina E order by data_e_hora;
/

/* Retorna informações sobre funcionário cujo cpf é '81287144933'*/
DECLARE
    medico tp_Medico;
BEGIN
SELECT VALUE(C) INTO medico FROM tb_Medico C WHERE C.cpf = '81287144933';
medico.descrever_funcionario();
END;
/

/* retorna todos os pacientes que possuem planos de celular registrados em Recife*/
SELECT P.nome as paciente, H.numero as numero_paciente
FROM tb_Paciente P , TABLE(P.telefone) H 
WHERE H.numero LIKE '81%';


/* */
