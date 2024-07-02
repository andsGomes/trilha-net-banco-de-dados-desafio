
select top 2 * from Filmes; 
select top 2 * from FilmesGenero;
select top 2 * from Atores;
select top 2 * from ElencoFilme;
select top 2 * from Generos; 

-- 1) Buscar o nome e ano do filme.

select f.nome, f.Ano  from Filmes f (nolock); 

-- 2) Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano.

select f.nome, f.Ano from Filmes f (nolock) order by f.ano asc;

-- 3) Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração

select f.Nome, f.Ano, f.Duracao from Filmes f (nolock) where f.nome = 'De Volta para o Futuro';

-- 4) Buscar os filmes lançados em 1997

select f.nome, f.Ano, f.Duracao  from Filmes f (nolock) where f.ano = 1997; 

-- 5) Buscar os filmes lançados APÓS o ano 2000

select f.nome, f.Ano, f.Duracao  from Filmes f (nolock) where f.ano > 2000; 

-- 6) Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente

select f.nome, f.Ano, f.Duracao  from Filmes f (nolock) where f.Duracao > 100 and f.Duracao < 150 order by f.Duracao asc; 

-- 7) Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

select f.Ano, count(f.ano) as Quantidade from  Filmes f (nolock) group by f.ano order by max(f.Duracao) desc; 

-- 8) Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome

select a.PrimeiroNome, a.UltimoNome  from Atores a (nolock) where a.Genero = 'M';

-- 9) Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome

select a.PrimeiroNome, a.UltimoNome  from Atores a (nolock) where a.Genero = 'F' order by a.PrimeiroNome;

-- 10)  Buscar o nome do filme e o gênero

select f.Nome, g.Genero
from Filmes f (nolock) 
inner join FilmesGenero fg (nolock) on f.id = fg.IdFilme 
inner join Generos g (nolock) on fg.IdGenero = fg.IdGenero

-- 11) Buscar o nome do filme e o gênero do tipo "Mistério"

select f.Nome, g.Genero
from Filmes f (nolock) 
inner join FilmesGenero fg (nolock) on f.id = fg.IdFilme 
inner join Generos g (nolock) on fg.IdGenero = fg.IdGenero
where g.Genero = 'Mistério'

-- 12) Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

select f.Nome,a.PrimeiroNome,a.UltimoNome ,ef.Papel
from ElencoFilme ef (nolock)
inner join Atores a (nolock) on ef.IdAtor = a.Id
inner join Filmes f (nolock) on ef.IdFilme = f.Id