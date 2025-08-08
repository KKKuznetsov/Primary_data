-- 1) Схема для сырых данных
CREATE SCHEMA IF NOT EXISTS raw;

-- 2) Таблица первичных данных
CREATE TABLE IF NOT EXISTS raw.primary_data (
    id               BIGSERIAL PRIMARY KEY,           -- NOT NULL по умолчанию
    supplier_id      VARCHAR        NOT NULL,
    period           TIMESTAMP      NOT NULL,
    supplier_name    VARCHAR,
    supplier_adress  VARCHAR,
    supplier_inn     VARCHAR,
    supplier_filial  VARCHAR,
    naklad           VARCHAR,
    client_inlaw     VARCHAR,
    client_adress    VARCHAR,
    client_inn       VARCHAR,
    client_region    VARCHAR,
    client_city      VARCHAR,
    client_id_ish    VARCHAR,
    client_brend     VARCHAR,
    client_name      VARCHAR,
    tms              VARCHAR        NOT NULL,
    tms_id_ish       VARCHAR,
    date_godnost     TIMESTAMP,
    mnf              VARCHAR,
    sum_nds          INTEGER        NOT NULL DEFAULT 0,
    sum_no_nds       INTEGER        NOT NULL DEFAULT 0,
    filename_result  VARCHAR,
    filename_ish     VARCHAR        NOT NULL,
    amount_type_1    INTEGER        NOT NULL DEFAULT 0,
    amount_type_2    INTEGER        NOT NULL DEFAULT 0,
    amount_type_3    INTEGER        NOT NULL DEFAULT 0,
    amount_type_4    INTEGER        NOT NULL DEFAULT 0,
    amount_type_5    INTEGER        NOT NULL DEFAULT 0,
    market           VARCHAR
    report_provider  VARCHAR        NOT NULL;
    report_provider_name VARCHAR    NOT NULL;
);

-- 3) Индексы: частые фильтры/соединения
CREATE INDEX IF NOT EXISTS idx_primary_data_supplier   ON raw.primary_data (supplier_id);
CREATE INDEX IF NOT EXISTS idx_primary_data_period     ON raw.primary_data (period);
CREATE INDEX IF NOT EXISTS idx_primary_data_tms        ON raw.primary_data (tms);
CREATE INDEX IF NOT EXISTS idx_primary_data_market     ON raw.primary_data (market);
CREATE INDEX IF NOT EXISTS idx_primary_data_filename   ON raw.primary_data (filename_ish);

-- Опционально: составной индекс, если часто ищете по связке поставщик+период
CREATE INDEX IF NOT EXISTS idx_primary_data_supplier_period
    ON raw.primary_data (supplier_id, period);


