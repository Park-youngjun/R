library(randomForest)
small_forest = randomForest(Species~., data = iris, ntree = 20, nodesize = 6, maxnodes =12)

small_forest


f1 = randomForest(Species~., data = iris)
f2 = randomForest(Species~., data = iris, ntree = 20, nodesize = 6, maxnodes =12)

newd = data.frame(Sepal.Length = c(4.7, 5.31, 6.4, 5.2, 6.3), Sepal.Width = c(3.2, 3.7, 3.22, 2.71, 3.3), Petal.Length = c(1.3, 1.5, 4.5, 3.9, 6.1), Petal.Width = c(0.22, 0.2, 1.5, 1.4, 2.5))

predict(f1, newdata = newd, type = 'prob')
predict(f2, newdata = newd, type = 'prob')

