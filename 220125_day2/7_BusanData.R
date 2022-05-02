# 부산 공공데이터 미션
# 부산광역시 현대 미술관 관람객수.csv
# R에서 csv로 읽기 read.csv('C:\Users\thdwo\Desktop\부산광역시_현대미술관 관람객 수_20201231.csv')
# 옵션이 없기 때문에 가장 상단은 제목, 문자는 factor로 읽음
# 데이터 샘플을 확인 = head(df,10)
# 구조파악 = str(df) : 타입, 행, 열의 개수
# 데이터의 기본 기술통계 = summary(df)
# NA 값을 반드시 확인 (summary 확인, is.na(df), table(is.na(df)), barplot(table...))
# NA 값을 처리 (0으로 대체, 중앙값이나 평균으로 대체, 행 제거, 임의값 대체)

#-------------------------------------------------------------------------------------------------------

# 빈도수 계산 = summary(factor.df[,1]))

setwd('C:/Users/thdwo/Downloads') # 작업 디렉토리 변경 후 dir 검색 # setwd로 작업 디렉토리 변경 가능

# csv 자료의 가장 윗자료를 필드명으로 가져온다

df = read.csv('C:/Users/thdwo/Downloads/부산광역시_현대미술관 관람객 수_20201231.csv')
str(df)
head(df,10)
names(df)
summary(df)

# 1. 자료의 연도만 출력
df$연도
df[,1]
min(df[,1])

# 2. 연도와 관람객 수만 출력
df[c(1,3)]

# 3. 위로 12개 자료만 출력, 즉 2018년도 자료
head(df,12)

# 4. 아래로 12개의 자료만 출력, 즉 2020년도 자료
tail(df,12)

# 5. 2018년도 월과 관람객 수만 출력
df[1:12, c(2,3)]

# 6. 2018년 자료가 12개, 2019년 자료가 12개, 2020년 자료가 12개 나오는지 확인
summary(factor(df$연도))
table(df$연도)
barplot(table(df$연도))


# R 에서 NA(결측치) 값을 0으로
summary(is.na(df[3])) # NA값이 17개인것을 확인
table(is.na(df[3])) # 테이블 만들기

plot(table(is.na(df[3]))) # 그래프 그리기
barplot(table(is.na(df[3]))) 

par(mfrow=c(3,1)) # 차트 화면분할, 차트창을 닫거나 par(mfrow=c(1,1))이 나올때까지 유지
index = 1
barplot(table(is.na(df[index])),main=names(df[index])) # main = 제목
index = 2  
barplot(table(is.na(df[index])),main=names(df[index]))
index = 3
barplot(table(is.na(df[index])),main=names(df[index])) 


# 차트 저장


