/* selecionar todos os médicos que começam com cpf 8 ou  cujo nome termina com n */

SELECT CPF,NOME FROM tb_Medico WHERE CPF LIKE '8%' or NOME LIKE '%n';/

/* selecionar todos os pacientes nascidos em 1990 ou adiante */
SELECT * FROM tb_Paciente where DATA_DE_NASCIMENTO >= TO_DATE('1990-01-01', 'YYYY-MM-DD');/

/* seleciona os hospitais cujo codigo identificador é 1, 3 ou 5*/
SELECT * FROM tb_Hospital where codigo_identificador_hospital IN (1,3,5);/

/* pega o registro do nome de pacientes encaminhados, 
do nome do médico responsável pelo encaminhamento 
e o nome do hospital ao qual foram encaminhados*/

SELECT DEREF(D.medico).nome, DEREF(D.paciente).nome, DEREF(D.hospital).nome 
FROM tb_Encaminha D;/

/* Retorna cpf, nome, sexo, data_de_nascimento e informações sobre o 
endereço de todos que moram em condominios (apto ou predio) */

SELECT cpf, nome, sexo, data_de_nascimento, (D.ENDERECO).cep,(D.ENDERECO).complemento, 
(D.ENDERECO).numero FROM tb_Paciente D WHERE (D.ENDERECO).complemento like 'Apt%' 
or (D.ENDERECO).complemento like 'Predio%';/

/* retorna a quantidade de homens e mulheres na tabela de pacientes */
SELECT COUNT(*),sexo from tb_Paciente group by sexo;/

/* */
