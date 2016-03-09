CREATE TABLE Usuario(
	id SERIAL NOT NULL,
	foto VARCHAR(100) NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL ,
	senha VARCHAR(32) NOT NULL,
	nomeCompleto VARCHAR(100) NOT NULL,
	apelido VARCHAR(30) NOT NULL UNIQUE,
	dataNascimento DATE NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	estado VARCHAR(30) NOT NULL,
	tipo BOOLEAN DEFAULT 'FALSE',

	PRIMARY KEY (id)

);

﻿create table filme (
	id serial not null,
	idUser integer not null,
	titulo varchar(30) not null,
	ano integer not null,
	sinopse text not null,
	foto varchar(100) not null,
	generos varchar(120) not null,
	atoresPrincipais varchar(120) not null,
	diretores varchar(120) not null,
	dataDeCadastro date not null,

	primary key(id),
	foreign key (idUser) references usuario (id) on delete cascade
);

﻿create table amizade (
	idUsuarioE integer not null,
	idUsuarioR integer not null,
	aceitou boolean default false,

	primary key (idUsuarioE, idUsuarioR),
	foreign key (idUsuarioE) references Usuario (id) on delete cascade,
	foreign key (idUsuarioR) references Usuario (id) on delete cascade
);

﻿create table avaliacao(
	id serial not null unique,
	idUsuario integer not null,
	idFilme integer not null,
	rating integer not null,
	comentario varchar not null,

	primary key(idUsuario, idFilme),
	foreign key (idUsuario) references usuario (id) on delete cascade,
	foreign key (idFilme) references filme (id) on delete cascade
);

﻿create table grupo(
	id SERIAL not null unique,
	idUsuario integer not null,
	nome varchar(50) not null unique,
	descricao varchar(250),

	primary key(id, nome),
	foreign key (idUsuario) references usuario (id) on delete cascade
);

﻿create table participagrupo (
	idusuario integer not null,
	idgrupo integer not null,
	useradmin boolean default false,

	primary key (idusuario, idgrupo),
	foreign key (idusuario) references Usuario (id) on delete cascade,
	foreign key (idgrupo) references Grupo (id) on delete cascade
)

﻿create table topico (
	id serial not null unique,
	idUsuario integer not null,
	idFilme integer not null,
	idGrupo integer not null,
	nomeDoTopico varchar(50) not null,

	primary key (idFilme, idGrupo),
	foreign key (idUsuario) references usuario (id)  on delete cascade,
	foreign key (idFilme) references filme (id)  on delete cascade,
	foreign key (idGrupo) references grupo (id) on delete cascade
);

﻿create table comentarioTopico(
	id serial not null,
	idUsuario integer not null,
	idTopico integer not null,
	comentario varchar(200) not null,

	primary key(id),
	foreign key (idUsuario) references usuario (id) on delete cascade,
	foreign key (idTopico) references topico (id) on delete cascade
);

﻿﻿create table notificacoes (
	id serial not null unique,
	idAmigo integer not null,
	idFilme integer,
	idUsuario integer not null,
	mensagem varchar(100) default 'recomendou para você o filme',

	primary key (id, idAmigo, idUsuario),
	Foreign key (idAmigo) references usuario (id) on delete cascade,
	Foreign key (idUsuario) references usuario (id) on delete cascade,
	Foreign key (idFilme) references filme (id) on delete cascade
);

﻿create table solicitacoes(
	id serial not null unique,
	idUsuario integer not null,
	idQuaseAmigo INteger not null,
	pendente boolean default false,
	resposta boolean default false,

	primary key (id, idUsuario, idQuaseAmigo),
	foreign key (idUsuario) references usuario (id) on delete cascade,
	foreign key (idQuaseAmigo) references usuario (id) on delete cascade
);
