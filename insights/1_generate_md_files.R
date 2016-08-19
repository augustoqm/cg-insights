library(knitr)

old_wd <- getwd()
setwd("insights")

knit(input = "como_funciona.Rmd")
knit(input = "quanto_ganham.Rmd")
knit(input = "temas_no_tempo.Rmd")
knit(input = "tematicas_parlamentares.Rmd")
knit(input = "vereador_expliqueme.Rmd")

setwd(old_wd)
