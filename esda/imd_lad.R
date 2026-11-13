print(all(diff(imd_lad$Index.of.Multiple.Deprivation..IMD..Rank >=0)))
sorted_imd_lad_asc <- imd_lad[order(imd_lad$Index.of.Multiple.Deprivation..IMD..Rank),]

print(sorted_imd_lad_asc[1:5,])

# EDA for the Attainment 8 for all school types

library(tmap)

all_schools_a8_char <-read.csv(file="data-key-stage-4-performance_all_school_types_25_26.csv",stringsAsFactors = FALSE)
head(all_schools_a8)
library(sf)
is.vector(all_schools_a8)
colnames(all_schools_a8)
all_schools_a8[,"establishment_type_group"]
summary(all_schools_a8)
summary(all_schools_a8_char)
library(ggplot2)

median(all_schools_a8$establishment_type_group)
is.data.frame(all_schools_a8)

# box plot

ggplot(all_schools_a8, aes(x = attainment8_average, y = "")) +
  geom_boxplot(
    fill = "#f7f5ee",      # Cream/off-white box fill
    color = "#333333",     # Dark grey outline
    outlier.shape = NA,    # Hide duplicate outlier dots (since jitter shows all points)
    width = 0.5            # Adjust vertical height of the box
  )+
  geom_jitter(
    aes(color = establishment_type_group),
    height = 0.2,          # Controls vertical spread of the dots
    size = 1.5,            # Dot size
    alpha = 0.85           # Slight transparency for overlapping dots
  ) +
  labs(
    title = "Attainment 8 - State Funded Schools 2025/26",
    x = "Average Attainment 8 Score",
    y = NULL,
    color = "School Type"
  ) +
  theme_minimal() +
  theme(
    panel.grid.major.y = element_blank(), # Remove horizontal gridline behind box
    #panel.grid.minor = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    legend.position = "bottom",
    legend.box = "horizontal",
    plot.title = element_text(size = 13, face = "plain")
  )

#historgram
mean_val   <- mean(all_schools_a8$attainment8_average, na.rm = TRUE)
sd_val     <- sd(all_schools_a8$attainment8_average, na.rm = TRUE)
median_val <- median(all_schools_a8$attainment8_average, na.rm = TRUE)

ggplot(data=all_schools_a8, aes(x = attainment8_average) )+ geom_histogram(
  aes(y = after_stat(density)),
  binwidth = 1,
)+
# Normal distribution bell curve overlay
stat_function(
  fun = dnorm,
  args = list(mean = mean_val, sd = sd_val),
  color = "#2c5452",      # Dark teal curve
  linewidth = 1
)+
labs(
    title = "Attainment 8 - State Funded Schools England and Wales, 2025/26",
    x = "Attainment 8 Score",
    y = "Density"
  )

table(all_schools_a8$establishment_type_group)

# filtered schools 
install.packages("dplyr")
library(dplyr)

filtered_school_type_no_all_state<- all_schools_a8 %>%
  filter(establishment_type_group %in% c("LA maintained mainstream", "Community school", "State-funded mainstream"))

ggplot(filtered_school_type, aes(x = attainment8_average, y = "")) +
  geom_boxplot(
    fill = "#f7f5ee",      # Cream/off-white box fill
    color = "#333333",     # Dark grey outline
    outlier.shape = NA,    # Hide duplicate outlier dots (since jitter shows all points)
    width = 0.5            # Adjust vertical height of the box
  )+
  geom_jitter(
    aes(color = establishment_type_group),
    height = 0.2,          # Controls vertical spread of the dots
    size = 1.5,            # Dot size
    alpha = 0.85           # Slight transparency for overlapping dots
  ) +
  labs(
    title = "Attainment 8 - State Funded Schools 2025/26",
    x = "Average Attainment 8 Score",
    y = NULL,
    color = "School Type"
  ) +
  theme_minimal() +
  theme(
    panel.grid.major.y = element_blank(), # Remove horizontal gridline behind box
    #panel.grid.minor = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    legend.position = "bottom",
    legend.box = "horizontal",
    plot.title = element_text(size = 13, face = "plain")
  )

head(all_schools_a8)
