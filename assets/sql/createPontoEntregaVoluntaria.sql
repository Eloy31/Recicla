-- Table: public.ponto_entrega_voluntaria

-- DROP TABLE public.ponto_entrega_voluntaria;

CREATE TABLE public.ponto_entrega_voluntaria
(
    id bigint NOT NULL,
    identificador character varying(255) COLLATE pg_catalog."default",
    setor_habitacional character varying(255) COLLATE pg_catalog."default",
    pontoreferencia character varying(255) COLLATE pg_catalog."default",
    imagem character varying(1000) COLLATE pg_catalog."default",
    observacao character varying(255) COLLATE pg_catalog."default",
    status character varying(255) COLLATE pg_catalog."default",
    latitude real,
    longitude real,
    CONSTRAINT ponto_entrega_voluntaria_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;