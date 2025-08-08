# Primary_data
Схема таблицы сырых (первичных) данных для ETL-проекта. Таблица хранит выгрузки “как есть” из источников (поставщики/клиенты/период/суммы/типы), чтобы затем выполнять нормализацию и загрузку в витрины.

## Что внутри репозитория
Primary_data.sql — SQL-скрипт создания схемы raw и таблицы raw.primary_data с индексами. 

## Поля таблицы
Таблица raw.primary_data содержит ключевые атрибуты файла и бизнес-поля:

- Идентификаторы/метаданные:
    id BIGSERIAL PRIMARY KEY
    supplier_id VARCHAR NOT NULL — ID поставщика
    tms VARCHAR NOT NULL — транспортная/системная метка
    filename_ish VARCHAR NOT NULL — исходное имя файла

- Период/даты:
    period TIMESTAMP NOT NULL — отчётный период
    date_godnost TIMESTAMP — срок годности (если есть)

- Поставщик:
    supplier_name, supplier_adress, supplier_inn, supplier_filial

- Клиент:
    client_inlaw, client_adress, client_inn, client_region, client_city, client_id_ish, client_brend, client_name

- Номенклатура/прочее:
    naklad, tms_id_ish, mnf, market

- Суммы:
    sum_nds INTEGER NOT NULL DEFAULT 0
    sum_no_nds INTEGER NOT NULL DEFAULT 0
    Количества по типам (могут быть отрицательными — возвраты и пр.):

- amount_type_1..5 INTEGER NOT NULL DEFAULT 0

- Доп. файл:
    filename_result VARCHAR
  
Индексы: по supplier_id, period, tms, market, filename_ish и составной по (supplier_id, period) — для быстрых фильтров/джоинов.

## Как развернуть

- через pgAdmin (GUI)
  1) Открой pgAdmin → подключись к своей БД (например, etl_demo).
  2) Tools → Query Tool → вставь содержимое Primary_data.sql.
  3) Нажми Execute (F5) — появится схема raw и таблица raw.primary_data. (Скрипт в репозитории: Primary_data.sql.) 
GitHub

- через psql
  1) psql -h localhost -U postgres -d etl_demo -f Primary_data.sql
   
