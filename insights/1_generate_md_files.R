library(knitr)

old_wd <- getwd()
setwd("insights")

knit(input = "como_funciona.Rmd", output = "como_funciona.md")
knit(input = "quanto_ganham.Rmd", output = "quanto_ganham.md")
knit(input = "temas_no_tempo.Rmd", output = "temas_no_tempo.md")
knit(input = "tematicas_parlamentares.Rmd", output = "tematicas_parlamentares.md")
knit(input = "vereador_expliqueme.Rmd", output = "vereador_expliqueme.md")

setwd(old_wd)
