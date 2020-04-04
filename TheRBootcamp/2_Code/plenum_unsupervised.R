
require(tidyverse)

gap <- read_csv('1_Data/gap.csv')
gap2017 <- gap %>% 
  filter(Jahr == 2007) %>% 
  select(`BIP pro Kopf`, Lebenserwartung)

plot(gap2017)
