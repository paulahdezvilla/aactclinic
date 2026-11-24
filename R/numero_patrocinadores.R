#’ Promotores que financian más ensayos
#’
#’ Conecta de forma remota al servidor PostgreSQL de AACT usando las
#’ credenciales almacenadas en .Renviron y ve los patrocinadores que financian más ensayos.
#’
#’ @return Una tabla con el número de ensayosen fase 3 por patrocinador
#’ @export
#’
#’ @examples
#’ \dontrun{
#’ resumen_ensayos_aact("Melanoma")
#’ }
top_10_patrocinadores <- function() {
  usuario <- Sys.getenv("AACT_USER")
  clave <- Sys.getenv("AACT_PASSWORD")
  if (usuario == "" || clave == "") {
    stop("Configura AACT_USER y AACT_PASSWORD en tu archivo .Renviron.")
  }
  con <- DBI::dbConnect(
    RPostgres::Postgres(),
    dbname = "aact",
    host = "aact-db.ctti-clinicaltrials.org",
    port = 5432,
    user = usuario,
    password = clave
  )
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  consulta_sql <- "
SELECT
    s.name,
    st.overall_status,
    COUNT(*) AS num_ensayos
FROM ctgov.studies AS st
INNER JOIN ctgov.sponsors AS s
    ON st.nct_id = s.nct_id
WHERE st.phase = 'PHASE3'
GROUP BY
    s.name,
    st.overall_status
ORDER BY
    num_ensayos DESC
LIMIT 10;
"
  DBI::dbGetQuery(
    con,
    consulta_sql
  )
}
