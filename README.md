# Banco de Dados I — Consultas DQL (Parte I)

Lista de exercícios de **consultas SQL (DQL)** desenvolvida na disciplina **Banco de Dados I** do curso de **Engenharia de Software (CEUB)**.

São 25 consultas sobre a base de vendas de uma rede de supermercados. Elas cobrem desde filtros simples até agregações com agrupamento, filtro de grupos e colunas calculadas.

---

## 🛠️ Tecnologias

- **PostgreSQL**: sistema gerenciador de banco de dados
- **pgAdmin 4**: interface para escrever e executar as consultas
- **Git e GitHub**: versionamento e entrega

---

## 🗂️ Modelo de dados

A base segue um **modelo dimensional (esquema estrela)**: uma tabela fato no centro, ligada a tabelas de dimensão pelas chaves.

```
                 dim_cliente
                      │
                      │ id_cliente
                      │
dim_produto ── fato_vendas ── dim_loja
      id_produto            id_loja
```

| Tabela | O que representa | Principais colunas |
|---|---|---|
| `fato_vendas` | Cada linha é um item vendido | `id_venda`, `data_venda`, `id_cliente`, `id_loja`, `id_produto`, `quantidade`, `preco_unitario`, `desconto`, `valor_total`, `canal`, `forma_pagamento` |
| `dim_produto` | Catálogo de produtos | `id_produto`, `nome_produto`, `marca`, `categoria`, `preco_tabela` |
| `dim_cliente` | Cadastro de clientes | `id_cliente`, `nome`, `email`, `sexo`, `data_nascimento`, `cidade` |
| `dim_loja` | Lojas da rede | `id_loja`, `nome_loja`, `cidade`, `uf`, `data_inauguracao` |

---

## 📚 Conceitos praticados

| Conceito | Questões |
|---|---|
| `SELECT`, `WHERE` e operadores de comparação | 04, 06, 15 |
| Tratamento de valores nulos (`IS NULL` / `IS NOT NULL`) | 01, 11, 21 |
| `DISTINCT` e `COUNT(DISTINCT ...)` | 02, 04 |
| Filtros por intervalo de datas (`BETWEEN`, `>=` / `<`) | 03, 12, 16, 19, 23, 24, 25 |
| Funções de agregação (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) | 01–03, 05, 06, 22–24 |
| Arredondamento com `ROUND` | 05, 09, 22, 25 |
| Busca por padrão de texto com `LIKE` | 13 |
| Agrupamento com `GROUP BY` | 08–10, 14, 16–21 |
| Filtro de grupos com `HAVING` | 10, 14, 20, 21 |
| Ordenação com múltiplos critérios e desempate (`ORDER BY`) | 07, 08, 10, 18, 21, 25 |
| Limite de linhas (`LIMIT`) | 07, 18, 19, 25 |
| Colunas calculadas e precedência de operadores | 25 |

---

## 📁 Estrutura do repositório

```
├── dql_parte1.sql   # as 25 consultas, identificadas por comentários (-- Questão 01 ... -- Questão 25)
└── README.md        # este arquivo
```

---

## ▶️ Como executar

1. No PostgreSQL, crie um banco de dados vazio (por exemplo, `mercado`).
2. Execute o script `mercado_dql.sql`, fornecido na disciplina, para criar as tabelas e inserir os dados.
3. Abra o arquivo `dql_parte1.sql` no **Query Tool** do pgAdmin, conectado a esse banco.
4. Execute o arquivo inteiro (F5) ou selecione uma consulta específica e execute só ela.

---

## 💡 Principais aprendizados

- **`NULL` não é um valor, é a ausência dele.** Por isso `= NULL` nunca é verdadeiro e o teste correto é `IS NULL`. Além disso, `COUNT(coluna)` ignora nulos, mas `COUNT(*)` conta todas as linhas.
- **A ordem de execução é diferente da ordem de escrita:** `FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT`. Isso explica:
  - por que `WHERE` filtra **linhas** e `HAVING` filtra **grupos**;
  - por que o apelido de coluna funciona no `ORDER BY`, mas não no `HAVING`.
- **Regra do `GROUP BY`:** toda coluna do `SELECT` que não está dentro de uma função de agregação precisa estar no `GROUP BY`.
- **Intervalos de datas:** com colunas `date`, o `BETWEEN` inclui os dois extremos. Já com `timestamp`, o mais seguro é `>= início AND < primeiro dia do período seguinte`.
- **Precedência de operadores:** `*` e `/` têm a mesma prioridade e são resolvidos da esquerda para a direita. Por isso os parênteses fazem diferença em cálculos como o de percentual.
- **Ordenar pelo valor exato ou pelo arredondado pode mudar o resultado.** Dois percentuais que parecem empatados depois do `ROUND` podem ser diferentes no valor real.

---

## 🤖 Uso de IA

Conforme a orientação da disciplina, a IA foi usada **apenas para revisar as consultas e explicar conceitos e sintaxe**. Todas as consultas foram escritas e testadas por mim.

---

## 👤 Autor

**Gustavo**, estudante de Engenharia de Software no CEUB
GitHub: [gustavocs-dot](https://github.com/gustavocs-dot)
