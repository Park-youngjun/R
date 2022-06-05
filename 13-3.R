install.packages('gapminder')


library(RCurl)
library(XML)

t = readLines('http://en.wikipedia.org/wiki/Data_science')
d = htmlParse(t, asText = T)
clean_doc = xpathSApply(d, "//p", xmlValue)

library(tm)
library(SnowballC)

doc = Corpus(VectorSource(clean_doc))

doc = tm_map(doc, content_transformer(tolower))
doc = tm_map(doc, removeNumbers)

dtm = DocumentTermMatrix(doc)

inspect(dtm)

library(wordcloud)
m = as.matrix(dtm)
v = sort(colSums(m), decreasing = T)
d= data.frame(word = names(v), freq = v)
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 100, random.order = F, rot.per = 0.35)

library(wordcloud2)
library(gapminder)
library(dplyr)

pop_data = gapminder%>%filter(year==2007)%>%group_by(continent)%>%summarise(sum(pop))
d = data.frame(word=pop_data[,1], freq =pop_data[,2])
wordcloud(words=d[,1], freq =d[,2], min.freq = 1, max.word = 100, random.order = F, rot.per = 0.35)
wordcloud2(d)
