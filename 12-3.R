library(caret)

control = trainControl(method = 'cv', number = 5)
f = train(Species~., data = iris, method = 'rf', metric = 'Acuuracy', trContorl = control)
confusionMatrix(f)
 