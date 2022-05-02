##################################################################

setwd = 'C:/Sources/StudyR/day3'
dir()

df = read.csv("전국무인교통단속카메라표준데이터.csv")
df

# 컬럼명 정리

names(df) = c( , , )

names(df)[1] <- '카메라Num'
names(df)[25] <- '제한속도factor'
names(df)
 names(df)[1] = names(df)[1] + 'bu' # Error R에서는 + 연결(산술)연산자를 사용할 수 없음

names(df)[1] = paste(names(df[1]), '-bu', sep = '')
names(df)[1] 








