library(dplyr)
library(stringr)
library(lubridate)
library(ggplot2)

rds_files <- list.files(path = "../data/", pattern = "_value.rds", full.names = TRUE) %>% 
  as_tibble() %>% 
  mutate(date = str_extract(value, "[0-9]{8}"),
         date = ymd(date)) %>% 
  arrange(desc(date)) %>% 
  pull(value) %>% 
  .[1]

value <- readRDS(rds_files)

valuebox <- tibble(x = 2,
                   y = 1,
                   text = paste0("Available Cases:\n", value),
                   fill =  "#d23264") %>%
  ggplot(aes(x, y, label = text, fill = fill)) +
  geom_tile() +
  geom_text(fontface = "bold", size = 12, color = "white") +
  scale_fill_identity() +
  theme_void() +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  labs(x = NULL, y = NULL, title = NULL) 

ggsave("valuebox.png",
       plot = valuebox,
       dpi = 300,
       width = 4,
       height = 2)
