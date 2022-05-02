############################################################################

# R 메모리 변수 모두 제거
# rm(list=())

rm(list=ls())
ls()

############################################################################

# 데이터 로드 후 재작업, 로드

setwd('C:/Sources/StudyR/day3')
dir()

fileName = '전국무인교통단속카메라표준데이터.csv'
df = read.csv(fileName, stringsAsFactors = TRUE) # TRUE는 대문자
str(df)

df1 = df[,c(1:9)]
df1

write.csv(df1, '작업자료.csv')
rm(list=ls())

df = read.csv('작업자료.csv', stringsAsFactor = TRUE)
str(df)

############################################################################

# 기술통계

names(df)[2] 
class(names(df)[2]) # 자료형 확인
summary(df[,2])
data.frame(summary(df[,2]))


summary(df) # rownum까지 저장되기 때문에 x 값이 생김
# 따라서 x를 삭제하기 위해
df = df[,-1]

# NA 값 처리

summary(df) # NA 값 확인
sum(is.na(df[,1]))
sum(is.na(df[,2]))
sum(is.na(df[,3]))
sum(is.na(df[,4]))

sum(is.na(df))
colName = names(df)
cnt = length(colName)
for (i in 1:cnt){ # for 구문
    print(colName[i]) # 1-9까지 이름나열
    print(sum(is.na(df[,i]))) # NA 값 나열
}

############################################################################

# 결측치 패키지

install.packages('naniar')
library(naniar) # naniar 패키지를 불러오기
naniar::miss_case_summary(df) # case: 행기준
naniar::miss_var_summary(df) # variable: 변수 기준
naniar::gg_miss_var(df)  # 보고서 형식
naniar::gg_miss_upset(df)

install.packages('VIM')
library(VIM):
VIM::aggr(riskfactors)# 보고서 형식

install.packages('Amelia')
library(Amelia)
missmap(df)# 보고서 형식


# 그래픽 창 저장

savePlot('무인카메라결측치', type = 'png')
