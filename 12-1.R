ucla = read.csv('http://stats.idre.ucla.edu/stat/data/binary.csv')
str(ucla)
ucla$admit = factor(ucla$admit)

library(rpart)
library(randomForest)
library(e1071)

r = rpart(admit ~. , data = ucla)
par(mfcol = c(1,1), xpd =NA)
plot(r)
text(r, use.n = T)

p = predict(r, ucla , type = 'class')
table(p, ucla$admit)

f = randomForest(admit~., data = ucla)
print(f)

s = svm(admit~., data = ucla, cost = 20)
print(s)

table(predict(s, ucla), ucla$admit)




