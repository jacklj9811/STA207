# PlantGrowth: weight of plants produced under 
# two distinct treatment conditions and a control condition.
dim(PlantGrowth)
head(PlantGrowth)
table(PlantGrowth$group)
# Summary
library(dplyr)
PlantGrowth%>%group_by(group) %>%
  summarise(count = n(),
            mean = mean(weight, na.rm = TRUE),
            sd = sd(weight, na.rm = TRUE))
# Plot
library(gplots)
plotmeans(weight ~ group, data = PlantGrowth, 
          xlab = "Treatment", ylab = "Weight",
          main="Mean Plot with 95% CI")
# One-way Anova
res.aov <- aov(weight ~ group, data = PlantGrowth)
summary(res.aov)
