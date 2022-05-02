########################################################################

setwd = 'C:\Sources\StudyR\day3'
dir()

df = read.csv('전국무인교통단속카메라표준데이터.csv')

# 필요한 컬럼민 모아서 별도의 데이터셋 제작

# 1: 불필요한 컬럼을 제거함으로서 수행속도를 높임
# 2: 분석하고자 하는 내요에 맞게끔 새로운 데이터프레임 구성 

names(df)
df1 = df[, c(2,3,4,7,11,13,14,16)]
df1
str(df1)

############################################################################

# 조건에 맞는 자료만 필터링 해서 새로운 데이터셋 제작
# with subset

# 단속구분을 unique 하게 받기
unique(df1$단속구분)

# subset을 이용하여 단속구분이 1인 자료만
subset(df1$단속구분, df1$단속구분 == '1') # 자료형 = character
subset(df1$제한속도, df1$제한속도 == 50) # 자료형 = integer
str(df1)

# subset을 이용하여 단속구분이 1을 제외한 자료만
subset(df1$단속구분, df1$단속구분 != '1')

# subset을 이용하여 단속구분이 1이면서 시도명이 '경기도'인 자료 (&, |)
subset(df1, df1$단속구분 == '1' & df1$시도명 == '경기도')
table(df1$시군구명)

############################################################################

자료셋을 새로 제작해서 csv로 저장하기

unique(df$시도명)

부산 = subset(df1, 시도명 == '부산광역시')
unique(부산$시군구명)

# 경기도 검색 후 분류

sido = unique(df1$시도명)
sido
index = 1 
tmp = subset(df1, 시도명==sido[index])

head(tmp)

# 저장하기 

sido = unique(df1$시도명)
length(sido) # 21

for (i in 1:length(sido)){ 
tmp = subset(df1, 시도명==sido[i])
fileName = paste(sido[i], '.csv', sep = '')
write.csv(tmp, file = fileName)
}

############################################################################

tmp = names(df1)
index = 1
findcol = tmp[index]

folderName = paste(findcol, sep = '')
dir.create(folderName)

head(unique(df1[,index])

dir()
