-- Lista a quantidade de venda de cada produto em ordem decrescente

SELECT p.nome_produto, p.id_produto, COUNT(v.id_venda) 
FROM produto AS p, venda AS v
WHERE p.id_produto = v.id_produto
GROUP BY p.nome_produto, p.id_produto
ORDER BY COUNT(v.id_venda) DESC;

-- Lista a quantidade de um produto específico no estoque em ordem decrescente

SELECT p.nome_produto, p.id_produto, SUM(e.quantidade) 
FROM produto AS p, estoque AS e
WHERE p.id_produto = e.id_produto
GROUP BY p.nome_produto, p.id_produto
ORDER BY SUM(e.quantidade) DESC;

-- Número de funcionários que trabalham integralmente

SELECT f.id_funcionario, p.nome_pessoa, f.turno
FROM funcionario AS f, pessoa AS p
WHERE p.id_pessoa = f.id_funcionario
AND f.turno = 'integral';

-- Número de funcionários que trabalham no turno da manhã

SELECT f.id_funcionario, p.nome_pessoa, f.turno
FROM funcionario AS f, pessoa AS p
WHERE p.id_pessoa = f.id_funcionario
AND f.turno = 'manha';

-- Número de funcionários que trabalham no turno da tarde

SELECT f.id_funcionario, p.nome_pessoa, f.turno
FROM funcionario AS f, pessoa AS p
WHERE p.id_pessoa = f.id_funcionario
AND f.turno = 'tarde';

-- Lista as vacinas aplicadas por cada veterinário

SELECT v.id_vacina, p.nome_pessoa as nome_veterinario, vt.id_veterinario
FROM vacina as v, veterinario as vt, pessoa as p
WHERE v.id_veterinario = vt.id_veterinario
AND vt.id_veterinario = p.id_pessoa
AND vt.id_veterinario = '27';

SELECT v.id_vacina, p.nome_pessoa as nome_veterinario, vt.id_veterinario
FROM vacina as v, veterinario as vt, pessoa as p
WHERE v.id_veterinario = vt.id_veterinario
AND vt.id_veterinario = p.id_pessoa
AND vt.id_veterinario = '26';

-- Mostra os atendimentos realizados por cada veterinário

SELECT a.id_servico, p.nome_pessoa as nome_veterinario, vt.id_veterinario
FROM atendimento_veterinario as a, veterinario as vt, pessoa as p
WHERE a.id_veterinario = vt.id_veterinario
AND vt.id_veterinario = p.id_pessoa
AND vt.id_veterinario = '27';

SELECT a.id_servico, p.nome_pessoa as nome_veterinario, vt.id_veterinario
FROM atendimento_veterinario as a, veterinario as vt, pessoa as p
WHERE a.id_veterinario = vt.id_veterinario
AND vt.id_veterinario = p.id_pessoa
AND vt.id_veterinario = '26';

-- Lista a quantidade de animais de porte pequeno, médio e grande

SELECT a.porte, COUNT(a.porte)
FROM animal as a
WHERE a.porte = 'P'
GROUP BY a.porte
UNION ALL
SELECT a.porte, COUNT(a.porte)
FROM animal as a
WHERE a.porte = 'M'
GROUP BY a.porte
UNION ALL
SELECT a.porte, COUNT(a.porte)
FROM animal as a
WHERE a.porte = 'G'
GROUP BY a.porte;