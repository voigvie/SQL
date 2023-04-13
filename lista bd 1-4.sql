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
