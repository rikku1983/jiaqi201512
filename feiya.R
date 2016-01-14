wi <- read.csv("wistudents.csv", stringsAsFactors=F)
sum(!duplicated(wi[,2:4]))
sum(!duplicated(wi[,6]))

names <- wi[,2:4]
ids <- wi[,2:6]

uni_name <- ids[!duplicated(names),]
uni_id <- ids[!duplicated(ids),]

diff <- ids[!duplicated(names)==F&!duplicated(ids)==T,] 
uni_id[duplicated(uni_id[,1:3]),]

uni_id2 <- uni_id[nrow(uni_id):1,]
uni_id2[duplicated(uni_id2[,1:3]),]

people_w_2_requester <- merge(uni_id[duplicated(uni_id[,1:3]),], uni_id2[duplicated(uni_id2[,1:3]),], by=c("First.Name", "Middle.Initial","Last.Name", "Name.Suffix"))
####Basically there are 6 people with exactly same name have 2 requester.return.field
# 
# library(compare)
# comp <- compare(uni_name, uni_id, allowAll=T)
# comp$tM
wi2 <- wi[,apply(wi, 2, function(x)length(unique(x))) != 1]
sapply(wi2, class)
wi2$Search.Date <- strptime(wi2$Search.Date, "%Y%m%d")
wi2$Enrollment.Begin <- strptime(wi2$Enrollment.Begin, "%Y%m%d")
wi2$Enrollment.End <- strptime(wi2$Enrollment.End, "%Y%m%d")

x<- wi[,2:6][as.numeric(!duplicated(wi[,6])) - as.numeric(!duplicated(wi[,2:4])),]
duplicated(x)


wiid <- wi[,2:6]
x1 <- wiid[duplicated(wiid),]

###test
x <- data.frame(v1=1:6, v2=1:6,v3=2:7)
