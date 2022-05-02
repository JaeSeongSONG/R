#####################################################################

# data 파악 변수 성격과 해설

tips # data.frame

# total_bills: 전체지불비용
# tip: tip 비용
# sex: 성별
# smoker: 흡연석/비흡연석
# day: 요일
# time: 방문시간
# size: 방문인원

str(tips)
head(tips)
sum(is.na(tips)) # NA 값 없음
unique(tips[,3])
levels(tips$day)


# 요일별 팁을 받는 횟수

table(tips$day) 

# 요일별 시간대에 따른 팁의 빈도

dinner = subset(tips, tips$time == 'Dinner')
table(dinner$day)

for(i in 1:length(tips)){
if (class(tips[,i]) == 'factor'){
    print(unique(tips[,i]))
}
}

#####################################################################

# 가설과 검증

# 귀무가설: 차이가 없거나 의미있는 차이가 없는 경우의 가설
# p value (유의확률) 로 확인

## 1. 성별(독립변수, x) 에 따른 tips (종속변수, y, 레이블) 의 비용은 같다 (zero가설, 귀무가설)

# 검증을 통해서 비용은 같다 -> 귀무가설 채택
# 비용이 다르다 -> 귀무가설 기각 / 대립가설 선택 (연구자가 주장하는)

table(tips[,3]) # 성별의 빈도수, 전체데이터에서 발생횟수
table(tips[,4])
table(tips[,5])
table(tips[,6])

for (i in c(3:7)){
print(table(tips[,i]))
}


## 2. 

din = subset(tips, time == 'Dinner')
lun = subset(tips, time == 'Lunch')

table(tips$time) # dinner 과 lunch 의 차이
table(din$day) # 각 요일별 저녁 차이
table(lun$day) # 각 요일별 점심 차이
head(din)

table(tips$time)
colMeans(din[c('total_bill', 'tip', 'size')])
colMeans(lun[c('total_bill', 'tip', 'size')])

colSums(din[c('total_bill', 'tip', 'size')])
colSums(lun[c('total_bill', 'tip', 'size')])

# 그래프 그리기
# 좋은 데이터란 편향과 분산이 평균과 근접해있는 데이터

par(mfrow=c(2,1))
plot(din$tip)
plot(lun$tip)

summary(lun)
tmp = (subset(lun, tip >= 4))
summary(tmp)

df = subset(tips, tips$day == 'Fri')
table(df$size)


## 3, 성별의 차이에 따라 tip의 차이가 없다.

Mal = subset(tips, sex == 'Male')
Fmal = subset(tips, sex == 'Female')

table(tips$sex) # 남녀 빈도 수 차이 확인
table(Mal$day)

summary(Mal) # 성별별 요약
summary(Fmal)

table(Fmal$day)
head(Mal)
head(Fmal)

par(mfrow = c(2,1))
plot(Fmal$tip, main = 'Female of Tips')
plot(Mal$tip, main = 'Male of tips') # 큰 영향이 없는 것으로 파악


par(mfrow = c(2,1))
plot(Fmal$size, main = 'Female of Tips')
plot(Mal$size, main = 'Male of Tips')






