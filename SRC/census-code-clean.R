library(tidyverse)
library(here)

#### DATA CLEANING ####

#Load raw census data
census2<-read.csv(here("DATA", "RAW", "census-at-school.csv"))

#Clean data to remove some rows and select variables memorygame, languages,
#pressure
census <- census2 %>% 
  filter(languages <= 2, pressure != "None") %>%
  select(memorygame, languages, pressure)

census$languages <- as.factor(census$languages)

#Save clean data to rda file
saveRDS(census, file = here("DATA", "OUTPUT", "census.rda"))

#Save clean data to csv file
write.csv(census, file = here("DATA", "OUTPUT", "census.csv"))

#### DATA VISUALIZATION

# Traditional file save
png(here("IMAGE", "boxplot.png"))
ggplot(data = census, aes(x = languages, y = memorygame, color = languages)) +
  geom_boxplot()
dev.off()

# ggplot specfic save
ggsave(here("IMAGE", "boxplot_alternate.png"))

#### SUMMARY STATISTICS

# Find range of memory game
source(here("LIB", "range_num.R"))
range_num(census$memorygame)

