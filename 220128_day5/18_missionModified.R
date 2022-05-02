rm(list=ls())

df=read.csv('C:/Users/thdwo/Desktop/빅데이터 전문가 과정/R 수업 자투리/참고교재 및 미션데이터전처리/data_r/cust_order_data.csv',sep='\t',encoding='ANSI', stringsAsFactors = TRUE)

str(df)

tmp = data.frame(table(df[,1]))
head(tmp)
summary(tmp$Freq)
boxplot(tmp$Freq)

table(df[,5])

boxplot(df[,16]) # quantity 확인

########################################################################

# 이상치를 확인하는 것이 매우 중요

tmp <- df$GOODS_NAME

tmp[tmp == '#NAME?'] <- NA
tmp <- tmp[complete.cases(tmp)]
str(tmp) # 처음 들어왔던 factor의 levels에 #NAME?이 있기 때문에 지워지지 않음
# factor는 지워도 levels는 남아있게 됨

tmp1 = as.factor(as.character(tmp))
str(tmp1) # character로 바꾸고 factor로 변환하면 가능
ㅌ
########################################################################


















