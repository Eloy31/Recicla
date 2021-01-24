-- Table: public.administrador

-- DROP TABLE public.administrador;

CREATE TABLE public.administrador
(
    id bigint NOT NULL,
    nome character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    senha character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT administrador_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;