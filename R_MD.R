library(rpart)
library(randomForest)
library(e1071)
library(caret)


ucla = read.csv('http://stats.idre.ucla.edu/stat/data/binary.csv')

str(ucla)
ucla$admit = factor(ucla$admit)

train_list = createDataPartition(y = ucla$admit, p = 0.6, list = F)
ucla_train = ucla[train_list, ]
ucla_test = ucla[-train_list, ]
  
control = trainControl(method = 'cv', number = 5)

r = train(admit~., data = ucla_train, method = 'rpart', metric = 'Accuracy', trControl = control)
f50 = train(admit~., data = ucla_train, method = 'rf', metric = 'Accuracy', trControl = control, ntree = 50)
f1000 = train(admit~., data = ucla_train, method = 'rf', metric = 'Accuracy', trControl = control, ntree = 1000)
k = train(admit~., data = ucla_train, method = 'knn', metric = 'Accuracy', trControl = control)
sr = train(admit~., data = ucla_train, method = 'svmRadial', metric = 'Accuracy', trControl = control)
sp = train(admit~., data = ucla_train, method = 'svmPoly', metric = 'Accuracy', trControl = control)


table(predict(r, newdata = ucla_test),ucla_test$admit)
table(predict(f50, newdata = ucla_test),ucla_test$admit)
table(predict(f1000, newdata = ucla_test),ucla_test$admit)
table(predict(k, newdata = ucla_test),ucla_test$admit)
table(predict(sr, newdata = ucla_test),ucla_test$admit)
table(predict(sp, newdata = ucla_test),ucla_test$admit)


pr = predict(r, newdata = ucla_test)
confusionMatrix(pr, ucla_test$admit)
pf50 = predict(f50, newdata = ucla_test)
confusionMatrix(pf50, ucla_test$admit)
pf1000 = predict(f1000, newdata = ucla_test)
confusionMatrix(pf1000, ucla_test$admit)
pk = predict(k, newdata = ucla_test)
confusionMatrix(pk, ucla_test$admit)
psr = predict(sr, newdata = ucla_test)
confusionMatrix(psr, ucla_test$admit)
psp = predict(sp, newdata = ucla_test)
confusionMatrix(psp, ucla_test$admit)

