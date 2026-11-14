-- Banco de Dados I
-- Aluno: Gustavo Costa Souza
-- Professor: Pedro Henrique Mello

-- Atividade - Lista de Exercícios DQL Parte II

-- Questão 1:
SELECT uf, COUNT(*) AS clientes
FROM   clientes_banco
WHERE  data_referencia = '2024-01-15'
GROUP  BY uf
ORDER  BY clientes DESC
LIMIT  5;

-- Questão 2:
SELECT nome, saldo
FROM   clientes_banco
WHERE  data_referencia = '2024-04-15'
ORDER  BY saldo DESC
LIMIT  1;

-- Questão 3:
SELECT COUNT(DISTINCT id_cliente) AS clientes_distintos
FROM   clientes_banco;

-- Questão 4:
SELECT ROUND(AVG(renda_mensal), 2) AS renda_media
FROM   clientes_banco
WHERE  data_referencia = '2024-12-15'
AND    segmento = 'Prime';

-- Questão 5:
SELECT profissao, COUNT(*) AS clientes
FROM   clientes_banco
WHERE  data_referencia = '2024-12-15'
GROUP  BY profissao
ORDER  BY clientes DESC
LIMIT  3;

-- Questão 6:
SELECT data_referencia, COUNT(*) AS contas_bloqueadas
FROM   clientes_banco
WHERE  status_conta = 'Bloqueada'
GROUP  BY data_referencia
ORDER  BY contas_bloqueadas DESC
LIMIT  1;

-- Questão 7:
SELECT cidade, ROUND(AVG(saldo), 2) AS saldo_medio
FROM   clientes_banco
WHERE  data_referencia = '2024-09-15'
GROUP  BY cidade
HAVING COUNT(*) >= 50
ORDER  BY saldo_medio DESC
LIMIT  1;

-- Questão 8:
SELECT SUM(saldo) AS saldo_total
FROM   clientes_banco
WHERE  data_referencia = '2024-12-15'
AND    segmento = 'Private';

-- Questão 9:
SELECT agencia, COUNT(*) AS clientes
FROM   clientes_banco
WHERE  data_referencia = '2024-12-15'
GROUP  BY agencia
ORDER  BY clientes DESC
LIMIT  1;

-- Questão 10:
SELECT data_referencia, SUM(saldo) AS saldo_total
FROM   clientes_banco
GROUP  BY data_referencia
ORDER  BY saldo_total DESC
LIMIT  1;

-- Questão 11:
SELECT COUNT(*) AS contas_encerradas
FROM   clientes_banco
WHERE  status_conta = 'Encerrada';

-- Questão 12:
SELECT ROUND(AVG(score_credito), 1) AS score_medio
FROM   clientes_banco
WHERE  data_referencia = '2024-06-15'
AND    uf = 'DF';

-- Questão 13:
SELECT COUNT(*) AS clientes
FROM   clientes_banco
WHERE  data_referencia = '2024-03-15'
AND    score_credito >= 700
AND    possui_cartao = FALSE;

-- Questão 14:
SELECT COUNT(*)
FROM   clientes_banco
WHERE  data_referencia = '2024-12-15';

SELECT COUNT(*)
FROM   clientes_banco
WHERE  data_referencia = '2024-12-15'
AND    canal_preferido = 'App';

-- Questão 15:
SELECT COUNT(DISTINCT id_cliente) AS novos_clientes
FROM   clientes_banco
WHERE  data_abertura BETWEEN '2024-01-01' AND '2024-12-31';

-- Questão 16: 
SELECT tipo_conta, ROUND(AVG(saldo), 2) AS saldo_medio
FROM   clientes_banco
WHERE  data_referencia = '2024-12-15'
GROUP  BY tipo_conta
ORDER  BY saldo_medio DESC;

-- Questão 17:
SELECT MAX(limite_credito) AS maior_limite
FROM   clientes_banco
WHERE  data_referencia = '2024-12-15'
AND    segmento = 'Varejo';

-- Questão 18:
SELECT sexo, COUNT(*) AS clientes
FROM   clientes_banco
WHERE  data_referencia = '2024-12-15'
AND    possui_investimento = TRUE
GROUP  BY sexo;

-- Questão 19:
SELECT uf, COUNT(*) AS clientes
FROM   clientes_banco
WHERE  data_referencia = '2024-12-15'
GROUP  BY uf
HAVING COUNT(*) < 13
ORDER  BY clientes;

-- Questão 20:
SELECT COUNT(*) AS clientes
FROM   clientes_banco
WHERE  data_referencia = '2024-12-15'
AND    data_nascimento < '1960-01-01';