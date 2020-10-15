library(sf)
library(tidyverse)
library(mapview)
library(nhdplusTools)

ecoli_dat <- read_csv('data/Ecoli_sites.csv') %>%
  select(-1) %>%
  st_as_sf(.,coords=c('Long','Lat'), crs = 4269) %>%
  st_transform(4263)




ecoli_sub <- ecoli_dat %>%
  sample_frac(0.01)


comid <- discover_nhdplus_id(ecoli_sub[1,])


