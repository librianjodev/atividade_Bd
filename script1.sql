DROP TABLE IF EXISTS dependente CASCADE;
DROP TABLE IF EXISTS alocacao CASCADE;
DROP TABLE IF EXISTS projeto CASCADE;
DROP TABLE IF EXISTS departamento CASCADE;
DROP TABLE IF EXISTS tbl_name CASCADE;

CREATE TABLE dependente (
	coddepend int unique not null,
    matricula int not null,
    nome VARCHAR(60) not null,
    sexo VARCHAR(1) not null,
    
    PRIMARY KEY (coddepend)
);


CREATE TABLE empregado (
	matricula int unique not null,
    nome VARCHAR(60) not null,
    endereco VARCHAR(60) not null,
    salario double not null,
    supervisor int not null,
    depart int not null,
    
    PRIMARY KEY(matricula),
    FOREIGN KEY (supervisor) REFERENCES empregado (matricula),
	FOREIGN KEY (depart) REFERENCES departamento (coddep)
);

CREATE TABLE alocacao (
	matric int unique not null,
    codigop int not null,
    horas int not null,
    
    PRIMARY KEY(matric),
    FOREIGN KEY (codigop) REFERENCES empregado (matricula)
);

CREATE TABLE projeto (
	codproj int unique not null,
    nome VARCHAR(60) not null,
    locaal VARCHAR(30) not null,
    depart int not null,
    
    PRIMARY KEY (codproj),
    FOREIGN KEY (depart) REFERENCES departamento (coddep)
);

CREATE TABLE departamento (
	coddep int unique not null,
    nome VARCHAR(20) not null,
    gerente int not null,
    dataini DATE not null,
    
    PRIMARY KEY(coddep),
    FOREIGN KEY (gerente) REFERENCES empregado (matricula)
);