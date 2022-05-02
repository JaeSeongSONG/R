######################################################################

# 데이터가 분석할 가치가 있다는 것 = 정규분포인가 확인하기


## 산점도 (scatter plot)

library(reshape2)

tips
str(tips)

plot(tips) # 전체적인 그래프

plot(tips[,1]) # Total_bill
head(tips[,1])

plot(tips[,1], tips[,2]) # Total_bill # tip # x, y 순

plot(tips[,7], tips[,1]) # size # Total_bill

str(tips)
colNum = c(1, 2, 7) # Total_bill # tip # size
par(mfrow = c(3,1)) # 3행 1열
for (i in colNum){
    plot(tips[,i], main = names(tips)[i])
}

plot(mtcars[,c(1,3,5,6)])


## 피어슨 상관계수 ( -1 ~ 1 사이의 값)
# 산업군에 따라 기준이 다름
# 문자열이 포함되어 있으면 나오지 않음
# 문자변수를 숫자변수로 바꿔야 함

cor(mtcars[,c(1,3,5,6)])

######################################################################

# 머신러닝 (기계학습)
# 독립변수들과 종속변수의 분석을 통한 예측, 분류 (이때 y 값과 연관있는 x값을 찾아내야함)
=> 상관도, pvalue 등 다양한 방법이 있음. y 값은 1개 변수, x 값은 1개 이상
eg) 취업성패 (y) 학습시간 (x1) 자격증 개수 (x2) 어학점수 (x3)

# 각 변수들간의 숫자값의 변화 시 어느정도 비율로 증가, 감소 하는지를 확인하는 공식을
# 상관계수라고 함. x값이 변하면 y값이 같이 변할 확률이 높은 변수(상관도가 높은)를 가려내야 함.

# 독립변수(x) 끼리는 상관도가 너무 높으면 안됨
# 상관도가 너무 높은 경우를 다중공선성이라고 함.
# 다중공선성은 VIF(분산팽창지수)로 10이상이 나오는 것을 의미
# 이런 경우 x 변수를 제거하고, VIF보고, x변수 제거하고 VIF 보는 활동을 반복

install.packages('PerformanceAnalytics')
library(PerformanceAnalytics) 
chart.Correlation(mtcars, histogram = TRUE, pch  = 19)

tmp = tips[, c(1,2,7)]
chart.Correlation(tmp, histogram = TRUE, pch  = 19) # ERROR tips가 문자열 포함






















