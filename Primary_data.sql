-- Схема
CREATE SCHEMA IF NOT EXISTS raw;

-- Таблица исходных данных
CREATE TABLE IF NOT EXISTS raw.primary_data (
    id                   BIGSERIAL PRIMARY KEY,           
    supplier_id          varchar,
    period               TIMESTAMPTZ,                     
    supplier_name        varchar,
    supplier_adress      varchar,
    supplier_inn         varchar,
    supplier_filial      varchar,
    naklad               varchar,
    client_inlaw         varchar,
    client_adress        varchar,
    client_inn           varchar,
    client_region        varchar,
    client_city          varchar,
    client_id_ish        varchar,
    client_brend         varchar,
    client_name          varchar,
    tms                  varchar,
    tms_id_ish           varchar,
    date_godnost         TIMESTAMPTZ,                    
    mnf                  varchar,
    sum_nds              NUMERIC(18,2),                   
    sum_no_nds           NUMERIC(18,2),                   
    filename_result      varchar,
    filename_ish         varchar,
    amount_type_1        NUMERIC(18,3),                   
    amount_type_2        NUMERIC(18,3),                   
    amount_type_3        NUMERIC(18,3),                   
    amount_type_4        NUMERIC(18,3),                   
    amount_type_5        NUMERIC(18,3),                  
    market               varchar,
    report_provider      varchar,
    report_provider_name varchar,
    client_type          varchar
);

-- (Опционально) Полезные индексы под типовые отборы
CREATE INDEX IF NOT EXISTS idx_primary_data_period
  ON raw.primary_data (period);

CREATE INDEX IF NOT EXISTS idx_primary_data_supplier
  ON raw.primary_data (supplier_id);

CREATE INDEX IF NOT EXISTS idx_primary_data_client_inn
  ON raw.primary_data (client_inn);

CREATE UNIQUE INDEX IF NOT EXISTS uq_primary_data_filename_ish
  ON raw.primary_data (filename_ish);
