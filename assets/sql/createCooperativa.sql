-- Table: public.cooperativa

-- DROP TABLE public.cooperativa;

CREATE TABLE public.cooperativa
(
    id bigint NOT NULL,
    identificador character varying(255) COLLATE pg_catalog."default",
    setor_habitacional character varying(255) COLLATE pg_catalog."default",
    responsavel character varying(255) COLLATE pg_catalog."default",
    contato character varying(100) COLLATE pg_catalog."default",
    cep character varying(10) COLLATE pg_catalog."default",
    observacao character varying(255) COLLATE pg_catalog."default",
    latitude real,
    longitude real,
    CONSTRAINT cooperativa_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;