-- associacao dfe herois

INSERT INTO assHeroi VALUES ( '11111', 'Unnamed');
INSERT INTO assHeroi VALUES ( '22222', 'Hero Association');
INSERT INTO assHeroi VALUES ( '33333', 'Neo Heroes');

-- cidades

INSERT INTO cidade VALUES ( '10120', 'City A');
INSERT INTO cidade VALUES ( '20560', 'City B');
INSERT INTO cidade VALUES ( '78952', 'City C');
INSERT INTO cidade VALUES ( '95103', 'City Z');

-- monstros

INSERT INTO monstro VALUES ( '00126', 'Garou');
INSERT INTO monstro VALUES ( '04826', 'Orochi');
INSERT INTO monstro VALUES ( '87456', 'Psykos');
INSERT INTO monstro VALUES ( '00256', 'Boros');
INSERT INTO monstro VALUES ( '87530', 'Goketsu');
INSERT INTO monstro VALUES ( '15896', 'Rei do Mar Profundo');
INSERT INTO monstro VALUES ( '78500', 'Führer Feio');
INSERT INTO monstro VALUES ( '88877', 'Centopeia Anciã');
INSERT INTO monstro VALUES ( '80126', 'Melzalgald');
INSERT INTO monstro VALUES ( '55216', 'Speed-o-Sound Sonic');

-- bonus

INSERT INTO bonus VALUES ( '00001', 10000);
INSERT INTO bonus VALUES ( '00002', 15000);
INSERT INTO bonus VALUES ( '00003', 20000);
INSERT INTO bonus VALUES ( '00004', 25000);
INSERT INTO bonus VALUES ( '00005', 30000);

-- herois

INSERT INTO heroi VALUES ( '11111', 'N', 'Fax hero');
INSERT INTO heroi VALUES ( '11111', 'N', 'Mangaka Hero');
INSERT INTO heroi VALUES ( '22222', 'C', 'Mumen Rider');
INSERT INTO heroi VALUES ( '22222', 'S', 'Blast');
INSERT INTO heroi VALUES ( '22222', 'S', 'Demon Cyborg Genos');
INSERT INTO heroi VALUES ( '22222', 'A', 'Saitama');
INSERT INTO heroi VALUES ( '22222', 'B', 'Blizzard of Hell Fubuki');
INSERT INTO heroi VALUES ( '22222', 'A', 'Death Gatling');
INSERT INTO heroi VALUES ( '33333', 'S', 'Metal Bat');
INSERT INTO heroi VALUES ( '33333', 'N', 'Suiryu');
INSERT INTO heroi VALUES ( '33333', 'N', 'Accel');


-- pessoa

INSERT INTO pessoa VALUES ( '12345678952', 'Agoni', '51652895', 'cidade a');
INSERT INTO pessoa VALUES ( '75369842012', 'Shizuka', '45287962', 'cidade z');
INSERT INTO pessoa VALUES ( '78520369741', 'Busho', '24789520', 'cidade c');
INSERT INTO pessoa VALUES ( '02357892014', 'Jinzuren', '02369875', 'cidade b');
INSERT INTO pessoa VALUES ( '36975201458', 'Sitch', '51652895', 'cidade a');
INSERT INTO pessoa VALUES ( '75236988000', 'Sekingar', '51652895', 'cidade a');
INSERT INTO pessoa VALUES ( '65214898950', 'Jose', '45287962', 'cidade z');
INSERT INTO pessoa VALUES ( '57851050364', 'Maria', '45287962', 'cidade z');
INSERT INTO pessoa VALUES ( '47891230156', 'Anna', '24789520', 'cidade c');


-- telefones

INSERT INTO pessoaFone VALUES ( '12345678952', '111-221-111');
INSERT INTO pessoaFone VALUES ( '12345678952', '111-222-121');
INSERT INTO pessoaFone VALUES ( '78520369741', '111-789-852');
INSERT INTO pessoaFone VALUES ( '75236988000', '111-123-741');
INSERT INTO pessoaFone VALUES ( '57851050364', '111-752-302');
INSERT INTO pessoaFone VALUES ( '47891230156', '111-785-200');

-- civil

INSERT INTO civil VALUES ( '65214898950');
INSERT INTO civil VALUES ( '57851050364');
INSERT INTO civil VALUES ( '47891230156');

-- executivo

INSERT INTO executivo VALUES ( '12345678952', 'Lider', '22222', NULL);
INSERT INTO executivo VALUES ( '75369842012', 'Funcionario', '22222', '12345678952');
INSERT INTO executivo VALUES ( '78520369741', 'Funcionario', '22222', '12345678952');
INSERT INTO executivo VALUES ( '02357892014', 'Lider', '33333', NULL);
INSERT INTO executivo VALUES ( '36975201458', 'Funcionario', '33333', '02357892014');
INSERT INTO executivo VALUES ( '75236988000', 'Lider', '11111', NULL);


-- relacao paga salario bonus entidade associativa

INSERT INTO pagaSalarioBonus VALUES ( '12345678952', '22222', '00005');
INSERT INTO pagaSalarioBonus VALUES ( '02357892014', '33333', '00003');
INSERT INTO pagaSalarioBonus VALUES ( '75236988000', '11111', '00001');
INSERT INTO pagaSalarioBonus VALUES ( '36975201458', '33333', NULL);


-- relacao n:n batalha

INSERT INTO batalha VALUES ( '00126', '22222', 'Saitama', TO_DATE('02/07/2018','DD/MM/YYYY'), '10120');
INSERT INTO batalha VALUES ( '15896', '22222', 'Demon Cyborg Genos', TO_DATE('15/01/2016','DD/MM/YYYY'), '10120');
INSERT INTO batalha VALUES ( '88877', '33333', 'Metal Bat', TO_DATE('01/10/2020','DD/MM/YYYY'), '95103');
INSERT INTO batalha VALUES ( '87530', '33333', 'Suiryu', TO_DATE('22/12/2010','DD/MM/YYYY'), '95103');
INSERT INTO batalha VALUES ( '00256', '22222', 'Saitama', TO_DATE('07/03/2000','DD/MM/YYYY'), '78952');