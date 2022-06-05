install.packages("caret")

library(rpart)
library(randomForest)
library(caret)

r = rpart(Species~., data=iris)
f = randomForest(Species~., data = iris, ntree = 9)
r_pred = predict(r, iris, type = 'class')
confusionMatrix(r_pred, iris$Species)

f_pred = predict(f,iris)
confusionMatrix(f_pred, iris$Species)
