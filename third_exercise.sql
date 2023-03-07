-- NÍVEL DE COLUNA
CREATE TABLE TAB_DEPARTAMENTO (
    NUM_DEPARTAMENTO NUMBER (10) CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY,
    NOM_DEPARTAMENTO VARCHAR2 (100) 
        CONSTRAINT NN_DEPARTAMENTO_NOMDEPARTAMENTO NOT NULL
        CONSTRAINT UN_DEPARTAMENTO_NOMDEPARTAMENTO UNIQUE,
    NUM_NSS_GERENTE NUMBER (10), --CONSTRAINT FK_DEPARTAMENTO_EMPREGADO REFERENCES TAB_EMPREGADO (NUM_NSS_EMPREGADO),
    QTD_EMPREGADO NUMBER (10) DEFAULT 0,
    DTA_INICIO_GERENCIA DATE
);

CREATE TABLE TAB_EMPREGADO (
    NUM_NSS_EMPREGADO NUMBER (10) CONSTRAINT PK_EMPREGADO PRIMARY KEY,
    DSC_ENDERECO VARCHAR2 (100),
    VAL_SALARIO NUMBER (12,2) CONSTRAINT NN_EMPREGADO_VALSALARIO NOT NULL,
    TIP_SEXO CHAR (1) CONSTRAINT CK_EMPREGADO_TIPSEXO CHECK (TIP_SEXO IN ('M', 'F', 'N')),
    DTA_NASCIMENTO DATE CONSTRAINT NN_EMPREGADO_DTANASCIMENTO NOT NULL,
    NOM_EMPREGADO VARCHAR2 (100) CONSTRAINT NN_EMPREGADO_NOMEMPREGADO NOT NULL,
    NUM_DEPARTAMENTO NUMBER (10), --CONSTRAINT FK_EMPREGADO_DEPARTAMENTO REFERENCES TAB_DEPARTAMENTO (NUM_DEPARTAMENTO),
    NUM_NSS_SUPERVISOR NUMBER (10), --CONSTRAINT FK_EMPREGADO_EMPREGADOSUPERVISOR REFERENCES TAB_EMPREGADO (NUM_NSS_EMPREGADO)
);
