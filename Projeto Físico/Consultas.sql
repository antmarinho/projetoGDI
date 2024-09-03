--GROUP BY/HAVING 

--Heróis com mais de uma batalha
SELECT 
    h.codAH,
    h.nomeH,
    COUNT(b.codM) AS numBatalhas
FROM 
    heroi h
INNER JOIN 
    batalha b ON h.codAH = b.codAH AND h.nomeH = b.nomeH
GROUP BY 
    h.codAH, 
    h.nomeH
HAVING 
    COUNT(b.codM) > 1;


--JUNÇÃO INTERNA

-- Todos os nomes dos heróis e o nome dos monstros que enfrentaram

SELECT 
    h.nomeH AS heroi_nome,
    m.nome AS monstro_nome
FROM 
    batalha b
INNER JOIN 
    heroi h ON b.codAH = h.codAH AND b.nomeH = h.nomeH
INNER JOIN 
    monstro m ON b.codM = m.codM;

--JUNÇÃO EXTERNA

--  todos os heróis e as batalhas em que participaram, mostrando também heróis que não participaram de nenhuma batalha 

SELECT 
    h.nomeH AS heroi_nome,
    b.codM AS monstro_cod
FROM 
    heroi h
LEFT JOIN 
    batalha b ON h.codAH = b.codAH AND h.nomeH = b.nomeH;

--SEMI JOIN

--heróis que participaram de PELO MENOS uma batalha

SELECT 
    h.nomeH AS heroi_nome
FROM 
    heroi h
WHERE 
    EXISTS (
        SELECT *
        FROM batalha b
        WHERE h.codAH = b.codAH AND h.nomeH = b.nomeH
    );

--ANTI-JOIN

--heróis que não participaram de  nenhuma batalha

SELECT 
    h.nomeH AS heroi_nome
FROM 
    heroi h
WHERE 
    (h.codAH, h.nomeH) NOT IN (
        SELECT b.codAH, b.nomeH
        FROM batalha b
    );

--SUBCONSULTA ESCALAR

--Cidades com menos de 2 batalhas

SELECT 
    c.nome
FROM 
    cidade c
WHERE 
    (SELECT COUNT(*)
     FROM batalha b
     WHERE c.codC = b.codC
    ) < 2;

--SUBCONSULTA LINHA

--Pessoas que moram na mesma cidade que Shizuka

SELECT 
    p2.nome
FROM 
    pessoa p1
JOIN pessoa p2 ON p1.end_cep = p2.end_cep
WHERE 
    p1.nome = 'Shizuka';

--SUBCONSULTA TABELA

--Nome dos executivos e a quantidade de bonus que receberam

SELECT 
    e.cpf,
    e.cargo,
    b.num_bonus
FROM 
    executivo e
LEFT JOIN (
    SELECT 
        cpf, 
        COUNT(*) AS num_bonus
    FROM 
        pagaSalarioBonus
    GROUP BY 
        cpf
) b ON e.cpf = b.cpf;


--OPERAÇÃO DE CONJUNTO

--lista todos os heróis e monstros 

SELECT 
    nomeH AS nome
FROM 
    heroi
UNION
SELECT 
    nome AS nome
FROM 
    monstro;

