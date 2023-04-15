/*1. Nomes dos filmes da locadora*/
select nome from filme;

/*2. Nome dos clientes que já locaram o filme com nome ‘a lagoa azul’*/
select nome from cliente where login not in (select distinct l.login_clienteFK from locar l
join unidade u on l.codigo_unidadeFK = u.codigo 
join filme f on f.codigo = u.codigo_filmeFK where f.nome = 'a lagoa azul');

/*3. Nome dos filmes que possuem unidades com áudio em ‘Português’ ou ‘Inglês’*/
select distinct f.nome from filme f join unidade u on u.codigo_filmeFK = f.codigo 
join possuir_audio pa on u.codigo = pa.codigo_unidadeFK
join idioma i on pa.codigo_idiomaFK = i.codigo
where i.nome in ('português', 'inglês');

/*4. O nome do(s) filme(s) que o usuário ‘Juliana Santos’ já locou.*/
select f.nome from filme f join unidade u on f.codigo = u.codigo_filmeFK
join locar l on u.codigo = l.codigo_unidadeFK
join cliente c on l.login_clienteFK = c.login
where c.nome = 'Juliana Santos';

/*5. O nome e o código dos filmes que nunca foram alugados.*/
select f.codigo, f.nome from filme f 
where f.codigo not in (select distinct u.codigo_filmeFK from unidade u join locar l on u.codigo = l.codigo_unidadeFK);

/*6. O nome dos clientes que nunca alugaram filme com legenda em ‘Inglês’.*/
select c.nome from cliente c where c.login not in (select distinct l.login_clienteFK from locar l 
join unidade u on l.codigo_unidadeFK = u.codigo
join possuir_legenda pl on u.codigo = pl.codigo_unidadeFK
join idioma i on pl.codigo_idiomaFK = i.codigo
where i.nome = 'Inglês');

/*7. O número de unidades que existem na locadora para o filme ‘Titanic’.*/
select nome, count(*) unidades from unidade u
join filme f on u.codigo_filmeFK = f.codigo
where f.nome = 'Titanic';

/*8. O nome do(s) cliente(s) que locou mais vezes o filme ‘Titanic’*/
select c.nome, count(*) as locacoes from cliente c
join locar l on c.login = l.login_clienteFK
join unidade u on l.codigo_unidadeFK = u.codigo
join filme f on u.codigo_filmeFK = f.codigo
where f.nome = 'Titanic'
group by c.nome
order by  locacoes desc;

/*9. Nome dos filmes que possuem unidades com áudio em ‘Português’ e ‘Inglês’*/
select f.nome from filme f
join unidade u on f.codigo = u.codigo_filmeFK
where exists (
  select 1 from possuir_audio pa
  join idioma i on pa.codigo_idiomaFK = i.codigo
  where pa.codigo_unidadeFK = u.codigo
    and i.nome = 'Português'
) and exists (
  select 1
  from possuir_audio pa
  join idioma i on pa.codigo_idiomaFK = i.codigo
  where pa.codigo_unidadeFK = u.codigo
    and i.nome = 'Inglês'
);

/*10. Os clientes que assistiram todos os filmes que o cliente de login'phsb'.*/
select c.nome from cliente c
join locar l on c.login = l.login_clienteFK
join unidade u on  l.codigo_unidadeFK = u.codigo
join filme f on u.codigo_filmeFK = f.codigo
join possuir_audio pa on u.codigo = pa.codigo_unidadeFK
join possuir_legenda pl on u.codigo = pl.codigo_unidadeFK
where f.codigo not in(select f2.codigo from filme f2
  where f2.codigo not in(select u2.codigo_filmeFK from unidade u2
  )
)
  and u.codigo in (select l2.codigo_unidadeFK from locar l2 where l2.login_clienteFK = 'phsb'
  )
  and (pa.codigo_idiomaFK in (select codigo from idioma where nome = 'Português'
    )
    or pa.codigo_idiomaFK in (select codigo from idioma where nome = 'Inglês'
    )
    or pa.codigo_idiomaFK is null
  )
  and (
    pl.codigo_idiomaFK in (select codigo from idioma where nome = 'Português'
    )
    or pl.codigo_idiomaFK in (select codigo from idioma where nome = 'Inglês'
    )
    or pl.codigo_idiomaFK is null
  )
group by c.nome
having count(distinct f.codigo) = (select count(distinct f2.codigo) from filme f2
)

