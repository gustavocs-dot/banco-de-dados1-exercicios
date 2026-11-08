-- Banco de Dados I
-- Aluno: Gustavo Costa Souza
-- Professor: Pedro Henrique Mello 

-- Atividade - Lista de Exercícios DQL Parte I

-- Questão 1:
SELECT COUNT(*) AS Clientes_nao_identificado
FROM fato_vendas
WHERE id_cliente IS NULL;

-- Questão 2:
SELECT COUNT (DISTINCT id_cliente) 
FROM fato_vendas;

-- Questão 3:
SELECT SUM(valor_total)
FROM fato_vendas
WHERE data_venda >= '2025-01-01' AND data_venda < '2026-01-01';

-- Questão 4:
SELECT DISTINCT marca
FROM dim_produto
WHERE categoria = 'Higiene'
ORDER BY marca ASC;

-- Questão 5:
SELECT ROUND(AVG(valor_total),2) AS media_vendas
FROM fato_vendas
WHERE canal = 'Aplicativo';

-- Questão 6:
SELECT COUNT (*)
FROM dim_produto
WHERE categoria = 'Bebidas' AND preco_tabela > 10;

-- Questão 7:
SELECT nome_produto, marca, preco_tabela
FROM dim_produto
ORDER BY preco_tabela DESC, nome_produto ASC
LIMIT 1;

-- Questão 8:
SELECT categoria, COUNT(*) AS qtd_produtos
FROM dim_produto
GROUP BY categoria
ORDER BY qtd_produtos DESC, categoria ASC;

-- Questão 9:
SELECT categoria, ROUND(AVG(preco_tabela), 2) AS media_categoria
FROM dim_produto
GROUP BY categoria
ORDER BY media_categoria DESC;

-- Questão 10:
SELECT cidade, COUNT(*) AS qtd_clientes
FROM dim_cliente
GROUP BY cidade
HAVING COUNT(*) >= 60
ORDER BY qtd_clientes DESC, cidade ASC;

-- Questão 11:
SELECT COUNT(*)
FROM dim_cliente
WHERE email IS NULL OR email='';

-- Questão 12:
SELECT COUNT(*)
FROM dim_cliente
WHERE sexo = 'F' AND data_nascimento BETWEEN '1990-01-01' AND '1999-12-31';

-- Questão 13:
SELECT COUNT(*)
FROM dim_cliente
WHERE nome ILIKE 'Ana %';

-- Questão 14: 
SELECT uf, COUNT(*) AS qtd_lojas
FROM dim_loja
GROUP BY uf
HAVING COUNT(*) > 3
ORDER BY qtd_lojas DESC;

-- Questão 15:
SELECT nome_loja, cidade, data_inauguracao 
FROM dim_loja
WHERE data_inauguracao < '2007-01-01'
ORDER BY data_inauguracao ASC;

-- Questão 16:
SELECT canal, SUM(valor_total) AS soma_total
FROM fato_vendas
WHERE data_venda BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY canal
ORDER BY soma_total DESC;

-- Questão 17:
SELECT forma_pagamento, COUNT(*) AS qtd_linhas, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE canal = 'Loja física'
GROUP BY forma_pagamento
ORDER BY faturamento DESC;

-- Questão 18:
SELECT SUM(quantidade) AS unidades_vendidas, id_produto
FROM fato_vendas
GROUP BY id_produto
ORDER BY unidades_vendidas DESC, id_produto ASC
LIMIT 10;

-- Questão 19:
SELECT id_loja, SUM(valor_total) AS faturamento_loja
FROM fato_vendas
WHERE data_venda BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY id_loja
ORDER BY faturamento_loja DESC
LIMIT 5;

-- Questão 20:
SELECT id_loja, COUNT(id_venda) AS linhas_loja
FROM fato_vendas
GROUP BY id_loja
HAVING COUNT(id_venda) > 300
ORDER BY linhas_loja DESC;

-- Questão 21:
SELECT id_cliente, COUNT(id_cliente) AS qtd_linhas
FROM fato_vendas
WHERE id_cliente IS NOT NULL
GROUP BY id_cliente
HAVING COUNT(id_cliente) >= 70
ORDER BY qtd_linhas DESC, id_cliente ASC;

-- Questão 22:
SELECT COUNT(id_venda) AS qtd_linhas, ROUND(AVG(desconto),2) AS desconto_medio
FROM fato_vendas
WHERE desconto > 0;

-- Questão 23:
SELECT MIN(valor_total) AS menor_venda, MAX(valor_total) AS maior_venda
FROM fato_vendas
WHERE data_venda BETWEEN '2025-12-01' AND '2025-12-31';

-- Questão 24:
SELECT COUNT(id_venda) AS qtd_vendas, SUM(valor_total) AS faturamento_dia
FROM fato_vendas
WHERE data_venda = '2025-12-24';

-- Questão 25:
SELECT id_venda, 
(quantidade * preco_unitario) AS valor_bruto, 
desconto, valor_total, 
ROUND(((desconto/(quantidade * preco_unitario))*100),2) AS desconto_percentual
FROM fato_vendas
WHERE canal = 'Site' AND desconto > 0 AND data_venda BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY ((desconto/(quantidade * preco_unitario))*100) DESC, id_venda ASC
LIMIT 10;















