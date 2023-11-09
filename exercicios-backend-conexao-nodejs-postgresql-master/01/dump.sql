create table autores (
  	id serial primary key,
  	nome text not null,
  	idade integer
 );
 
create table livros (
   	id serial primary key,
   	autor_id integer not null references autores(id),
   	nome text not null,
   	genero text,
   	editora text,
   	data_publicacao date
);