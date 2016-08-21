library(RPostgreSQL)
library(dplyr)

camara_db <- NULL

StartCamaraDB <- function(){
    if (is.null(camara_db)) {
        postgres_user <- Sys.getenv("POSTGRES_USER")
        postgres_pass <- Sys.getenv("POSTGRES_PASS")
        camara_db <<- src_postgres(dbname = "camara_db", user = postgres_user, password = postgres_pass)
    }
    camara_db
}

GetEmentaRaw <- function(db, cols){
    tbl(StartCamaraDB(), sql("SELECT * FROM ementas")) %>%
        select(-c(document_number, process_number, process_year, autograph_number, has_image)) %>%
        filter(published_date >= "2009-01-01") %>%
        mutate(published_month = date_trunc('month', published_date)) %>%
        collect() %>%
        mutate(ementa_type = ifelse(ementa_type == "LEI ORDINÁRIA", "PROJETO DE LEI ORDINÁRIA",
                                    ifelse(ementa_type == "LEI COMPLEMENTAR", "PROJETO DE LEI COMPLEMENTAR",
                                           ementa_type)),
               main_theme = ifelse(ementa_type == "REQUERIMENTO" & main_theme == "DENOMINAÇÃO DE RUA", "TRANSITO URBANO",
                                   ifelse(ementa_id == "2015-10-07#PROJETO DE LEI ORDINÁRIA#374#APROVADO", "DENOMINAÇÃO DE RUA",
                                          main_theme)),
               govern = ifelse(published_date < "2013-01-01", "Anterior (2009 - 2012)", "Atual (2013 - 2016)")) %>%
        select(-ementa_id)
}
