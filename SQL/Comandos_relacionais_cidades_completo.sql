SELECT aluno_rikelme.Nome,
       cidade_rikelme.Nome
FROM  aluno_rikelme

SELECT aluno_rikelme.Nome,
       cidade_rikelme.Nome
FROM  aluno_rikelme, cidade_rikelme

WHERE aluno_rikelme.cidade_rikelme_idcidade_rikelme = cidade_rikelme.idcidade_rikelme

SELECT aluno_rikelme.Nome,
       aluno_rikelme.Email,
       cidade_rikelme.Nome,
	   uf_rikelme.Sigla
FROM  aluno_rikelme, cidade_rikelme, uf_rikelme

WHERE aluno_rikelme.cidade_rikelme_idcidade_rikelme = cidade_rikelme.idcidade_rikelme

SELECT aluno_rikelme.Nome,
       aluno_rikelme.Email,
       cidade_rikelme.Nome,
	   uf_rikelme.Sigla,
       ddd_rikelme.Nome
FROM  aluno_rikelme, cidade_rikelme, uf_rikelme, ddd_rikelme

WHERE aluno_rikelme.cidade_rikelme_idcidade_rikelme = cidade_rikelme.idcidade_rikelme 
AND cidade_rikelme.idcidade_rikelme =uf_rikelme.idUF_rikelme 
AND cidade_rikelme.idcidade_rikelme 
=   ddd_rikelme.idDDD_rikelme

/*---------------------------------------------------------------------*/

SELECT aluno_rikelme.Nome,
       aluno_rikelme.Email,
	   aluno_rikelme.Peso/(aluno_rikelme.Altura*aluno_rikelme.Altura) as 'IMC',
	   cidade_rikelme.Nome,
	   uf_rikelme.Nome,
	   uf_rikelme.Sigla
FROM aluno_rikelme, cidade_rikelme, uf_rikelme, ddd_rikelme

WHERE	aluno_rikelme.cidade_rikelme_idcidade_rikelme=cidade_rikelme.idcidade_rikelme
AND cidade_rikelme.uf_rikelme_iduf_rikelme=uf_rikelme.iduf_rikelme
AND cidade_rikelme.ddd_rikelme_idddd_rikelme=ddd_rikelme.idddd_rikelme
AND uf_rikelme.Sigla NOT IN ('SP')

SELECT COUNT(*) FROM aluno_rikelme
WHERE uf_rikelme.Sigla='SC'

SELECT COUNT(*)
FROM aluno_rikelme, uf_rikelme, cidade_rikelme
WHERE uf_rikelme.Sigla='SC'
AND aluno_rikelme.cidade_rikelme_idcidade_rikelme=cidade_rikelme.idcidade_rikelme
AND cidade_rikelme.UF_rikelme_idUF_rikelme=uf_rikelme.idUF_rikelme

ALTER TABLE aluno_rikelme

ADD Peso REAL,
ADD	Altura REAL,
ADD	Renda REAL

UPDATE aluno_rikelme
SET Peso=67, Altura=1.83, Renda=5000
WHERE ialuno_rikelme=1
