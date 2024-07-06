WITH index_data AS (
  SELECT
        indexrelid AS index_oid,
        indrelid::regclass::text AS tabela,
        indexrelid::regclass::text nome_index,
        collname ,
        typ.typname AS index_type,
        pn.nspname AS schema_name
   FROM (
     SELECT 
            indexrelid, 
            indrelid,indkey, 
            indcollation[i] coll 
       FROM pg_index, generate_subscripts(indcollation, 1) g(i)
   ) s
   JOIN pg_collation c            ON (coll = c.oid)
   LEFT JOIN pg_attribute col     ON (col.attnum = ANY(s.indkey) AND col.attrelid = s.indrelid)
   LEFT JOIN pg_type typ          ON (typ.oid = col.atttypid)
   JOIN pg_class pc               ON (s.indexrelid = pc.oid)
   JOIN pg_namespace pn           ON (pn.oid = pc.relnamespace)
  WHERE collprovider IN ('d', 'c') 
    AND collname NOT IN ('C', 'POSIX') 
), distinct_index_data AS (
SELECT
    index_oid,
    schema_name,
    tabela,
    nome_index,
    pg_size_pretty(pg_relation_size(index_oid)) AS index_size_pretty,
    pg_relation_size(index_oid) AS index_size_bits,
    pg_get_indexdef(index_oid) AS index_def
  FROM index_data
  GROUP BY index_oid,schema_name,tabela,nome_index
)
SELECT
   format('%s.%s|%s',schema_name, tabela, nome_index) AS run
FROM (
  SELECT
         did.schema_name,
         did.tabela,
         did.nome_index,
         did.index_size_pretty,
         psai.idx_scan,
         psai.idx_tup_read,
         psai.idx_tup_fetch,
        did.index_def
   FROM distinct_index_data did
  INNER JOIN pg_stat_all_indexes psai ON (did.index_oid = indexrelid)
  ORDER BY psai.idx_scan DESC, index_size_bits DESC
) AS resultadofinal
ORDER BY schema_name, tabela
;
