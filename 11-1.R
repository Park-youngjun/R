install.packages("randomForest")
library(randomForest)

f = randomForest(Species~., data = iris)
f

plot(f)

varUsed(f)
varImpPlot(f)
treesize(f)
//test