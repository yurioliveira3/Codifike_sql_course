-- TABLE USERS
DROP TABLE IF EXISTS mnc.tb_usuario;
CREATE TABLE mnc.tb_usuario (
    id SERIAL,
    nome VARCHAR(200) NOT NULL,
    doc VARCHAR(200) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    CONSTRAINT usuario_pk PRIMARY KEY(id)
);

-- TABLE RECEITAS
DROP TABLE IF EXISTS mnc.tb_receita;
CREATE TABLE mnc.tb_receita (
    id SERIAL,
    titulo VARCHAR(100),
    ingredientes TEXT,
    valor decimal(10,2),
    como_fazer TEXT,
    id_usuario INT8,
    CONSTRAINT receita_pk PRIMARY KEY(id)
);

-- DELETE ALL DATA FROM TABLE - DO VACUUM
TRUNCATE mnc.tb_usuario;
TRUNCATE mnc.tb_receita;

-- DELETE A REGISTRY - DON'T DO A VACUUM
DELETE FROM mnc.tb_usuario WHERE nome = 'Jose';
DELETE FROM mnc.tb_receita WHERE titulo = 'Receita Brigadeiro';
