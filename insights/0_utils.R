library(RPostgreSQL)
library(dplyr)

StartCamaraDB <- function(){
    postgres_user <- Sys.getenv("POSTGRES_USER")
    postgres_pass <- Sys.getenv("POSTGRES_PASS")
    src_postgres(dbname = "camara_db", user = postgres_user, password = postgres_pass)
}
