install.packages("class")
library(e1071)
library(class)
s = svm(Species~., data = iris, cost = 20)
print(s)

table(predict(s, iris), iris$Species)
v= svm(Species~., data = iris, kernel = 'polynomial')
p = predict(v, iris)
table(p, iris$Species)

train = iris
test = data.frame(Sepal.Length = c(4.7, 5.31, 6.4, 5.2, 6.3), Sepal.Width = c(3.2, 3.7, 3.22, 2.71, 3.3), Petal.Length = c(1.3, 1.5, 4.5, 3.9, 6.1), Petal.Width = c(0.22, 0.2, 1.5, 1.4, 2.5))
k = knn(train[,1:4], test, train$Species, k=5)
k

s = svm(Species~., data = iris, cost = 1)
table(predict(s, iris), iris$Species)
