library(tidyverse)
library(ggeo)

cars %>%
  ggplot(aes(speed, dist)) +
  geom_point() +
  labs(title = "TEST",
       subtitle = "Test 1",
       caption = "Blabla") +
  ggeotheme("pomological_green", mode = "light")

ggeosave("test")
