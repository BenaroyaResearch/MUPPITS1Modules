## code to prepare `DATASET` dataset goes here
library(limma)

MUPPITS1bloodModules<-read.csv(file=file.path("data-raw", "allBloodModules.csv"))
MUPPITS1nasalModules<-read.csv(file=file.path("data-raw", "allNasalModules.csv"))

MUPPITS1bloodDesign <- read.csv(file=file.path("data-raw", "tempus_design_all4Phases_387samples_update2.csv"))
MUPPITS1nasalDesign <- read.csv(file=file.path("data-raw", "nasalDesign_374samples.csv"))

load(file=file.path("data-raw", "nasalVoom_374samples.RData"))
load(file=file.path("data-raw", "bloodVoom_387samples.RData"))

stopifnot(all(colnames(MUPPITS1bloodVoom$E) == MUPPITS1bloodDesign$library.sampleId))
stopifnot(all(colnames(MUPPITS1nasalVoom$E) == MUPPITS1nasalDesign$library.sampleId))

usethis::use_data(MUPPITS1nasalModules, MUPPITS1bloodModules,
                  MUPPITS1nasalVoom, MUPPITS1bloodVoom,
                  MUPPITS1nasalDesign, MUPPITS1bloodDesign,
                  overwrite = TRUE)
