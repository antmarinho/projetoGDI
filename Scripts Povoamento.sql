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
INSERT INTO monstro VALUES ( '00126', 'Melzalgald');
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
