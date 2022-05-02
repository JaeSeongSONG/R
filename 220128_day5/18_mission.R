######################################################################################

# [미션. 1-1] 데이터 읽기전 메모리 모두 제거

rm(list=ls()) # 메모리 제거
gc()

memory.limit() # 메모리 제거 확인
ls()

df=read.csv('C:/Users/thdwo/Desktop/빅데이터 전문가 과정/R 수업 자투리/참고교재 및 미션데이터전처리/data_r/cust_order_data.csv',sep='\t',encoding='ANSI')

######################################################################################

#[미션. 1-2] 총데이터의 갯수와 변수 성격 확인

str(df) # 510470개, 변수 16개
 $ CUST_SERIAL_NO: int  1000000023 1000000023 1000000023 1000000014 1000000014 1000000014 1000000002 1000000002 1000000002 1000000015 ...
 $ SEX           : chr  "F" "F" "F" "F" ...
 $ AGE           : chr  "40" "40" "40" "60" ...
 $ REG_DATE      : chr  "11-Jul" "11-Jul" "11-Jul" "11-Jul" ...
 $ ORDER_DATE    : chr  "2011-11-14" "2012-05-28" "2012-05-28" "2011-08-30" ...
 $ ORDER_HOUR    : chr  "[0, 3[" "[0, 3[" "[0, 3[" "[0, 3[" ...
 $ ORDER_WEEKDAY : chr  "토" "토" "토" "일" ...
 $ IS_WEEKEND    : logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
 $ GOODS_CODE    : int  20261 20728 20729 20062 20133 20129 20008 20011 20144 20003 ...
 $ LGROUP        : int  20 10 10 70 70 80 10 50 10 85 ...
 $ MGROUP        : int  2 10 10 2 2 3 13 1 10 1 ...
 $ SGROUP        : int  1 3 1 1 1 1 3 23 3 10 ...
 $ DGROUP        : int  1 1 1 4 11 2 5 6 1 4 ...
 $ GOODS_NAME    : chr  "더무료체험" "메쉬런닝화 + 슈즈 2종 여성" "메쉬런닝화 +  슈즈 2종  남성" "왕만두 16봉 구성 +추가구성 참치" ...
 $ PRICE         : int  61500 42500 42500 53400 33400 0 157500 24300 43300 282500 ...
 $ QTY           : int  1 1 1 1 1 1 1 1 1 1 ...

head(df, 8)

names(df)

######################################################################################

[미션. 1-3] 아래의 2개 변수(필드)외에 나머지 변수에 대하여 해석
CUST_SERIAL_NO: 고객번호 / SEX: 고객성별

str(df[,c(-1,-2)])

######################################################################################

[Part2] 자료 오류 확인


[미션. 2-1] 결측치 확인 (참고R교재 33p-34p)

sum(is.na(df)) # 결측치 없는 것으로 확인

table(is.na(df)) # 전부 FALSE로 확인

######################################################################################

[미션. 2-2] 결측치 활용법 (참고교재 P35)

install.packages("data.table")
 
summary(factor(df$GOODS_NAME))  #NAME? 2123  

head(subset(df,df$GOODS_NAME == '#NAME?')) # #NAME이 있는 데이터 출력

df$GOODS_NAME[df$GOODS_NAME == '#NAME?']<- NA # 그 데이터에 NA 할당
table(is.na(df)) # NA 값 개수 확인

  FALSE    TRUE 
8165397    2123 


library(naniar)
naniar::gg_miss_var(df) # 결측치 시각화

df=df[complete.cases(df),] # 결측치 제거
nrow(subset(df,df$GOODS_NAME=='#NAME?')) # 결측치 파악: 0개
table(is.na(df)) # FALSE 8133552로 모두 제거된 것을 확인

######################################################################################

[factor의 요인값 제거하여도 levels 값은 변경되지 않음. ]

str(df)   # 자료보면 14번 열의 GOODS_NAME에 #NAME? 존재함.
class(df[,14])    # factor로 나옴
df[,14]=factor(as.character(df[,14]))  # 문자열로 변경후 다시 factor함.(factor은 필요하면 함)
class(df[,14])  # 확인해보면 다시 factor 되어 있음
str(df)   # df[,14] 에 #NAME? 없어짐

######################################################################################

[ df의 모든 factor를 character로 변경하고자함]

cnt=length(df)
cnt # 16

for (i in 1:cnt) {               # df에서 factor가 존재한다면 factor를 character로 변환
    if (class(df[,i])=='factor'){
        df[,i]=as.character(df[,i])
        }
}
str(df) # 모두 character로 변환된 것을 확인

# 다시 factor로 변환해서도 levels에 '*' 이 있는 경우는 unique로 '*' 표시가 실제 있다는 뜻

cnt=length(df)
cnt # 16

for (i in 1:cnt) {
    if (class(df[,i])=='character'){
        df[,i]=as.factor(df[,i])
        }
}
str(df) 

## '*' 이 있는 자료 제거는
# 방법1: '*' 표시가 있는 자료를 NA로 변경하고, NA값 제거
# 방법2: '*' 표시가 없는 자료만 다시 별도로 제작
# 여기서는 방법2로 작업

df2=subset(df,df[,2]!='*')     # df2: '*' 표시가 없는 자료만 다시 별도로 제작
colNum=c(2,3,4,6,7) # 2,3,4,6,7 행에서 * 값이 확인됨
for (i in colNum){
    print(paste('---------------', i, '번째컬럼: 컬럼명은 ', names(df)[i]))
    print(unique(df2[,i]))
    cat('\n')    # 한줄 띄는 명령어는 cat으로 사용해야함.      
}
 
######################################################################################

[Part3] 문자 자료 날짜자료로 변환후 파생변수 (년,월,요일등제작)

df2$ORDER_DATE = as.Date(df2$ORDER_DATE) # as.Date 로 날짜변수로 변환
tmp = df2$ORDER_DATE # tmp에 할당
str(tmp) # Date로 변한 것을 확인

######################################################################################

[미션. 3-2] Date 형식 자료 년,월,일,요일 제작

install.packages("lubridate")
library(lubridate)

df2$year=year(df2$ORDER_DATE) # df2에 year 변수를 만들고 df2$ORDER_DATE 데이터의 year 자료를 넣음
df2$month=month(df2$ORDER_DATE) # df2에 month 변수를 만들고 df2$ORDER_DATE 데이터의 month  자료를 넣음

head(df2)
str(df2)

######################################################################################

[미션. 3-2] 성별의 F는 'female' / M은 'male'로 변환하여 새로운 gender 변수생성

unique(df2[,2]) # levels에 F M 2가지만 존재하는 것을 확인

subset(df2[,2], df2[,2] == '*')
 
table(df2[,2]) # * 0 F 325388 M 179847

df2$gender = ifelse(df2[,2] =='F', 'F', 'M')
table(df2$gender) # gender 분포 확인


































