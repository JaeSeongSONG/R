# 디렉토리 경로 설정
setwd('C:/Sources/StudyR/day3')
dir()

##########################################################

# csv 파일 열기
fileName = '전국무인교통단속카메라표준데이터.csv'
df = read.csv(fileName)
df

str(df)
head(df,10)

barplot(table(df$시도명))

##########################################################

# 조건에 맞는 행과 열의 값 추출하기 subset(데이터, 조건)
tmp = subset(df, df$시도명 == '01')
str(tmp)

##############################################################

# 시도명이 01이면 서초구만 있는가
summary(factor(tmp$소재지지번주소))
table(tmp$소재지지번주소)
unique(tmp$소재지지번주소)
levels(factor(tmp$소재지지번주소))

###############################################################

# character를 factor로 변환 (시도명, 시군구명, 도로종류, 도로노선명)
# 숫자를 factor로 변환하는 파생변수 (설치연도, 제한속도)
df$시도명 <- factor(df$시도명)
df$시군구명 <- factor(df$시군구명)
df$도로종류 <- factor(df$도로종류)
df$도로노선명 <- factor(df$도로노선명)

str(df)
levels(df$시도명)

#############################################################

# 파생변수 만들기
df$설치연도Factor = factor(df$설치연도)
df[,25] = factor(df$제한속도)
str(df) # variation = 25, original_variation = 23

############################################################

# plot
plot(df[,24]) # 설치연도 # NA 값 존재

#################################################################

# 복습용

str(df)

ma = df$제한속도
ncol(ma)
nrow(ma)
length(ma)
mean(ma)

ma = df[,c(10,11)] # 위도, 경도
head(ma)
colMeans(ma)
rowMeans(ma)










