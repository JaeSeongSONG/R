##########################################################

## box plot
# outlier 제거의 문제

library(reshape2)
tips

boxplot (tips$tip)
tt = subset(tips, tip < 5) # outlier 제거
summary(tt)
boxplot(tt$tip)

str(tt)
boxplot(tip~day, data = tt)


tmp = subset(tips, day == 'Sat')
par(mfrow = c(2,2))
boxplot(tip~size, data = tmp) # tip 자료를 size 자료로 나눔
boxplot(tip~sex, data = tmp) # tip 자료를 sex 자료로 나눔
boxplot(tip~smoker, data = tmp) # tip 자료를 smoker 자료로 나눔
boxplot(tip~time, data = tmp) # tip 자료를 time 자료로 나눔

##########################################################

## mtcars

mtcars
str(mtcars)

par(mfrow = c(2,1))
plot(mtcars$mpg ~ mtcars$gear)
boxplot(mtcars$mpg ~ mtcars$gear) # 연비 자료를 기어 개수 자료로 나눔

cor(mtcars$mpg, mtcars$gear) # 상관계수

plot(mtcars$mpg, mtcars$vs)
boxplot(mtcars$mpg ~ mtcars$vs)
cor(mtcars$mpg, mtcars$vs)

plot(mtcars$mpg, mtcars$am)
boxplot(mtcars$mpg ~ mtcars$am)
cor(mtcars$mpg, mtcars$am)

boxplot(mtcars)

##########################################################

# scaling 데이터 간의 연관성이나 비율을 보고 싶을 때
# 비율값을 표현하기 때문에 빠른 결과값을 볼 수 있음
# 표준화 scaling이라고 함 

tmp = scale(mtcars)
summary(tmp)
boxplot(tmp)

 





















