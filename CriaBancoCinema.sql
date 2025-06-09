CREATE TABLE GeneroLucas (
  idGeneroLucas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Nome VARCHAR(35)  NULL    ,
PRIMARY KEY(idGeneroLucas));



CREATE TABLE CinemaLucas (
  idCinemaLucas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Nome VARCHAR(50)  NULL  ,
  Cidade VARCHAR(35)  NULL    ,
PRIMARY KEY(idCinemaLucas));



CREATE TABLE AtorLucas (
  idAtorLucas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Nome VARCHAR(50)  NULL    ,
PRIMARY KEY(idAtorLucas));



CREATE TABLE SalaLucas (
  idSalaLucas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  CinemaLucas_idCinemaLucas INTEGER UNSIGNED  NOT NULL  ,
  Nome VARCHAR(50)  NULL  ,
  Capacidade INT  NULL    ,
PRIMARY KEY(SalaLucas)  ,
INDEX SalaLucas_FKIndex1(CinemaLucas_idCinemaLucas),
  FOREIGN KEY(CinemaLucas_idCinemaLucas)
    REFERENCES CinemaLucas(idCinemaLucas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE FilmeLucas (
  idFilmeLucas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  GeneroLucas_idGeneroLucas INTEGER UNSIGNED  NOT NULL  ,
  Nome VARCHAR(50)  NULL  ,
  Tempo TIME  NULL  ,
  Ci INT  NULL    ,
PRIMARY KEY(idFilmeLucas)  ,
INDEX FilmeLucas_FKIndex1(GeneroLucas_idGeneroLucas),
  FOREIGN KEY(GeneroLucas_idGeneroLucas)
    REFERENCES GeneroLucas(idGeneroLucas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE SessaoLucas (
  idSessaoLucas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  SalaLucas_idSalaMiguel INTEGER UNSIGNED  NOT NULL  ,
  FilmeLucas_idFilmeLucas INTEGER UNSIGNED  NOT NULL  ,
  Nome VARCHAR(50)  NULL  ,
  DataSessao DATE  NULL  ,
  HoraSessao TIME  NULL  ,
  Valor REAL  NULL  ,
  Dublado BOOL  NULL  ,
  Legenda BOOL  NULL  ,
  Libras BOOL  NULL    ,
PRIMARY KEY(idSessaoLucas)  ,
INDEX SessaoLucas_FKIndex1(FilmeLucas_idFilmeLucas)  ,
INDEX SessaoLucas_FKIndex2(SalaLucas_idSalaMiguel),
  FOREIGN KEY(FilmeLucas_idFilmeLucas)
    REFERENCES FilmeLucas(idFilmeLucas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(SalaLucas_idSalaMiguel)
    REFERENCES SalaLucas(idSalaMiguel)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE FilmeLucas_has_AtorLucas (
  FilmeLucas_idFilmeLucas INTEGER UNSIGNED  NOT NULL  ,
  AtorLucas_idAtorLucas INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(FilmeLucas_idFilmeLucas, AtorLucas_idAtorLucas)  ,
INDEX FilmeLucas_has_AtorLucas_FKIndex1(FilmeLucas_idFilmeLucas)  ,
INDEX FilmeLucas_has_AtorLucas_FKIndex2(AtorLucas_idAtorLucas),
  FOREIGN KEY(FilmeLucas_idFilmeLucas)
    REFERENCES FilmeLucas(idFilmeLucas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(AtorLucas_idAtorLucas)
    REFERENCES AtorLucas(idAtorLucas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




