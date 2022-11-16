CREATE TABLE pessoa (
    id_pessoa SERIAL NOT NULL,
    cpf CHAR(11) NOT NULL,
    nome_pessoa VARCHAR(45),
    telefone VARCHAR(20),
    endereco VARCHAR(60),
    data_nascimento DATE,
    email VARCHAR(45),
    CONSTRAINT pessoa_pk PRIMARY KEY (id_pessoa)
);

CREATE TABLE cliente (
    id_cliente SERIAL NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (id_cliente),
    CONSTRAINT cliente_fk_pessoa FOREIGN KEY (id_cliente)
        REFERENCES pessoa(id_pessoa)
);

CREATE TABLE funcionario (
    id_funcionario SERIAL NOT NULL,
    carga_horaria REAL,
    turno VARCHAR(10),
    conta_bancaria VARCHAR(45),
    CONSTRAINT funcionario_pk PRIMARY KEY (id_funcionario),
    CONSTRAINT funcionario_fk_pessoa FOREIGN KEY (id_funcionario)
        REFERENCES pessoa(id_pessoa)
);


CREATE TABLE atendente (
    id_atendente SERIAL NOT NULL,
    CONSTRAINT atendente_pk PRIMARY KEY (id_atendente),
    CONSTRAINT atendente_fk_pessoa_id FOREIGN KEY (id_atendente)
        REFERENCES funcionario(id_funcionario)
);

CREATE TABLE gerente (
    id_gerente SERIAL NOT NULL,
    CONSTRAINT gerente_pk PRIMARY KEY (id_gerente),
    CONSTRAINT gerente_fk_pessoa_id FOREIGN KEY (id_gerente)
        REFERENCES funcionario(id_funcionario)
);

CREATE TABLE veterinario (
    id_veterinario SERIAL NOT NULL,
    crmv VARCHAR(15) NOT NULL,
    CONSTRAINT veterinario_pk PRIMARY KEY (id_veterinario),
    CONSTRAINT veterinario_fk_pessoa FOREIGN KEY (id_veterinario)
        REFERENCES funcionario(id_funcionario)
);

CREATE TABLE animal (
    id_animal SERIAL NOT NULL,
    id_cliente SERIAL NOT NULL,
    porte CHAR(1),
    sexo CHAR(1),
    nome VARCHAR(45),
    peso REAL,
    cor VARCHAR(45),
    raca VARCHAR(45),
    CONSTRAINT animal_pk PRIMARY KEY (id_animal),
    CONSTRAINT animal_fk_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);

CREATE TABLE servicos (
    id_servico SERIAL NOT NULL,
    valor REAL NOT NULL,
    data_servico DATE,
    horario TIME,
    id_cliente SERIAL NOT NULL,
    id_animal SERIAL NOT NULL,
    CONSTRAINT servicos_pk PRIMARY KEY (id_servico),
    CONSTRAINT servicos_fk_cliente FOREIGN KEY (id_cliente)
        REFERENCES pessoa(id_pessoa),
    CONSTRAINT servicos_fk_animal FOREIGN KEY (id_animal)
        REFERENCES animal(id_animal)
);

CREATE TABLE atendimento_veterinario (
    id_servico SERIAL NOT NULL,
    id_veterinario SERIAL NOT NULL,
    CONSTRAINT atendimento_veterinario_pk PRIMARY KEY (id_servico),
    CONSTRAINT atendimento_veterinario_fk_servico FOREIGN KEY (id_servico)
        REFERENCES servicos(id_servico),
    CONSTRAINT atendimento_veterinario_fk_veterinario FOREIGN KEY (id_veterinario)
        REFERENCES veterinario(id_veterinario)
);

CREATE TABLE vacina (
    id_servico SERIAL NOT NULL,
    id_veterinario SERIAL NOT NULL,
    lote VARCHAR(15),
    id_vacina SERIAL NOT NULL,
    CONSTRAINT vacina_pk PRIMARY KEY (id_servico, id_vacina),
    CONSTRAINT vacina_fk_servico FOREIGN KEY (id_servico)
        REFERENCES servicos(id_servico),
    CONSTRAINT vacina_fk_veterinario FOREIGN KEY (id_veterinario)
        REFERENCES veterinario(id_veterinario)
);

CREATE TABLE tosa_banho (
    id_servico SERIAL NOT NULL,
    CONSTRAINT tosa_banho_pk PRIMARY KEY (id_servico),
    CONSTRAINT tosa_banho_fk_servico FOREIGN KEY (id_servico)
        REFERENCES servicos(id_servico)
);

CREATE TABLE produto (
    id_produto SERIAL NOT NULL,
    preco REAL,
    nome_produto VARCHAR(45),
    CONSTRAINT produto_pk PRIMARY KEY (id_produto)
);

CREATE TABLE venda (
    id_venda SERIAL NOT NULL,
    id_cliente SERIAL NOT NULL,
    data_venda DATE,
    valor_total REAL,
    quantidade INT,
    id_produto SERIAL NOT NULL,
    CONSTRAINT venda_pk PRIMARY KEY (id_venda),
    CONSTRAINT venda_fk_cliente_id FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),
     CONSTRAINT venda_fk_produto FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
);

CREATE TABLE estoque (
    id_estoque SERIAL NOT NULL,
    lote VARCHAR(15),
    quantidade INT,
    id_produto SERIAL NOT NULL,
    data_recibo DATE,
    CONSTRAINT estoque_pk PRIMARY KEY (id_estoque),
    CONSTRAINT estoque_fk_produto FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
);