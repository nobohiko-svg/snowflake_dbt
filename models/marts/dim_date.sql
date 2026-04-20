-- Query untuk membuat tabel kalender statis
select
    date_day as date_id,
    extract(year from date_day) as year,
    extract(month from date_day) as month,
    extract(day from date_day) as day
from (
    select '2023-01-01'::date + (row_number() over (order by null) - 1) as date_day
    from table(generator(rowcount => 1095)) -- Untuk 3 tahun
)