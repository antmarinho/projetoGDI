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

-- quantidade de heroi nos Rank S e sem rank

SELECT h.rankh, COUNT(h.rankh) AS QTDHeroi
FROM heroi h
GROUP BY h.rankh
HAVING h.rankh IN ('S', 'N')

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
    
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

-- nome dos executivos com o numero de telefone igual a 111-789-852 e 111-785-200

SELECT p.nome
FROM pessoa p INNER JOIN pessoafone f ON p.cpf = f.cpf
WHERE f.fone IN ('111-789-852','111-785-200') 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--JUNÇÃO EXTERNA

--  todos os heróis e as batalhas em que participaram, mostrando também heróis que não participaram de nenhuma batalha 

SELECT 
    h.nomeH AS heroi_nome,
    b.codM AS monstro_cod
FROM 
    heroi h
LEFT OUTER JOIN 
    batalha b ON h.codAH = b.codAH AND h.nomeH = b.nomeH;

-- nome dos executivos q n recebe bonus

SELECT p.nome
FROM executivo e RIGHT OUTER JOIN pagasalariobonus b ON e.cpf = b.cpf INNER JOIN pessoa p ON p.cpf = e.cpf
WHERE b.codb IS NULL

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

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

-- mostra o codigo dos bonus q sao maior q a media dos bonus

SELECT b.codb 
FROM bonus b
WHERE b.valor >
	(SELECT AVG(b.valor)
     FROM bonus b)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--SUBCONSULTA LINHA

--Pessoas que moram na mesma cidade que Shizuka

SELECT 
    p2.nome
FROM 
    pessoa p1
INNER JOIN pessoa p2 ON p1.end_cep = p2.end_cep
WHERE 
    p1.nome = 'Shizuka';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--SUBCONSULTA TABELA

--Nome dos executivos e a quantidade de bonus que receberam

SELECT 
    e.cpf,
    e.cargo,
    b.num_bonus
FROM 
    executivo e
LEFT OUTER JOIN (
    SELECT 
        cpf, 
        COUNT(*) AS num_bonus
    FROM 
        pagaSalarioBonus
    GROUP BY 
        cpf
) b ON e.cpf = b.cpf;

-- cpf dos lideres de associacao q os herois batalharam

SELECT e.cpf
FROM executivo e
WHERE e.codah IN 
    (SELECT b.codah 
	 FROM heroi h LEFT OUTER JOIN batalha b ON b.nomeh = h.nomeh
	 WHERE b.codah IS NOT NULL) AND e.cargo = 'Lider'

-- Monstros que batalharam contra heróis de rank S

SELECT nome  
FROM monstro  
WHERE codM IN ( 
    SELECT codM  
    FROM batalha  
    WHERE (codAH, nomeH) IN ( 
        SELECT codAH, nomeH 
        FROM heroi  
        WHERE rankH = 'S' 
    ) 
)

-- Cidades em que os Heróis de Rank A Batalharam

SELECT c.nome 
FROM cidade c 
INNER JOIN batalha b ON c.codC = b.codC 
INNER JOIN heroi h ON b.codAH = h.codAH 
WHERE h.rankH = 'A' 
GROUP BY c.nome 
HAVING COUNT(DISTINCT h.codAH) = ( 
    SELECT COUNT(DISTINCT h2.codAH) 
    FROM heroi h2 
    WHERE h2.rankH = 'A' 
)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PL/SQL

-- procedimento q imprime os herois de acordo com o codico da associacao passado por paramentro

CREATE OR REPLACE PROCEDURE procuraHeroiPelaAsso (cod VARCHAR) IS

    CURSOR buscar IS
	
    	SELECT 	h.nomeh
    	FROM heroi h INNER JOIN assheroi a ON a.codah = h.codah
		WHERE a.codah = cod;
    
    nome heroi.nomeh%TYPE;

BEGIN 

    OPEN buscar;

	LOOP

		FETCH buscar INTO nome;
		EXIT WHEN buscar%NOTFOUND;
		
        dbms_output.put_line('Heroi - ' || nome);
		
    END LOOP;

	CLOSE buscar;

END;

BEGIN

    procuraHeroiPelaAsso('22222');
	
END;

--Função com Parâmetro: retorna o total de bônus para um executivo com base no cpf_param fornecido.

CREATE FUNCTION total_bonus(cpf_param VARCHAR(11))
RETURNS NUMBER
BEGIN
    DECLARE total NUMBER;
    SELECT SUM(b.valor) INTO total
    FROM pagaSalarioBonus psb
    JOIN bonus b ON psb.codB = b.codB
    WHERE psb.cpf = cpf_param;
    RETURN total;
END;

-- Função que verifica se um CPF é de um civil de acordo com o parâmetro p_cpf

CREATE OR REPLACE FUNCTION verificar_civil(p_cpf VARCHAR2) 
RETURN BOOLEAN 
IS
    v_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM civil
    WHERE cpf = p_cpf;
    
    RETURN v_count > 0;
EXCEPTION
    WHEN OTHERS THEN
        RETURN FALSE;
END;

-- Procedimento que lista todas as batalhas de um herói específico.

CREATE OR REPLACE PROCEDURE listar_batalhas_heroi(
    p_nomeH batalha.nomeH%TYPE
) 
IS
BEGIN
    FOR rec IN (
        SELECT 
            b.codM,
            m.nome AS Nome_Monstro,
            b.dataBatalha,
            c.nome AS Nome_Cidade
        FROM 
            batalha b
        JOIN 
            monstro m ON b.codM = m.codM
        JOIN 
            cidade c ON b.codC = c.codC
        WHERE 
            b.nomeH = p_nomeH
        ORDER BY 
            b.dataBatalha DESC
    ) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Monstro: ' || rec.Nome_Monstro || 
                             ', Data: ' || TO_CHAR(rec.dataBatalha, 'DD-MM-YYYY') || 
                             ', Cidade: ' || rec.Nome_Cidade);
    END LOOP;
