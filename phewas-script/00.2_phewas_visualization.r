setwd("[path]")

library(data.table)
library(PheWAS)

results <- fread("[phewas_results]")

phewasManhattan(results, max.y=310, y.axis.interval = 30,
                         significant.line=0.05/776, suggestive.line=0.05/776,
                         # significant.line=0.005, suggestive.line=0.005,
                         OR.size = F, OR.direction = T,
                         annotate.angle=0, sort.by.category.value=T,
                         # title= paste0("PRS-PheWAS"),#, date()),
                         x.axis.label="Phenotypes",
                         y.axis.label=expression(-log[10](italic(p))))