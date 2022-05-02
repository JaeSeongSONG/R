# 스크립트 창에서 작성한 코드는 커서를 
# 그 줄에 두고 ctrl + R 또는 f5
# R 에서는 명목형변수의 factor가 있음. eg) man/woman, True/False
# 자료형 확인은 str(변수명)으로 확인가능.
# factor는 자료 split 안되지만, 유니크한 레벨을 가지고 있음. 카테고리별로 분류하는 이점이 있을때 사용
# => plot(변수) 했을 때 count 집계가 가능함.
# 문자자료를 factor로 변경하는 방법 = as.factor(변수), factor(변수)
# 벡터 (모든 요소가 동일한 자료형)

직업명 = c('데이터과학자','엔지니어', '엔지니어', '세금관리자', '분석관리자') 
채용수 = c(4184, 2725,2599, 3317,1958)
평균급여 = c(110,110,105,110,112)
직업만족도 = c(4,4,4,0,4)


# 2개 이상의 자료를 갖는 리스트 구조에서
# R에서는 직업명 = (''), 파이썬에서는 초기화 작업명 = []
# R 에서는 작업명 = c()
# 파이썬 type(), R str()


직업명
str(직업명) 
summary(직업명) # 구조 확인 가능 (length, class, mode)
summary(채용수) # (min, median, mean max 등)
summary(평균급여)


plot(평균급여)
plot(직업명) # Error : character이기 때문
직업명fa=as.factor(직업명) # factor 값으로 변경
직업명fa # levels : 중복값 제거 후 나열, 순서 바꾸기 (인덱싱) 가능
summary(직업명fa)
plot(직업명fa) # plot 가능


data = data.frame(직업명, 채용수, 평균급여, 직업만족도)
data # data가 엑셀처럼 보임. dataframe을 만드는 것
str(data)
plot(data) # 상관도
data$직업명 # data안에 있는 행을 가져오는 것
data$평균급여


# strsplit(변수, 글자를 나눌 기준)
a = c('python/r/cobol/r', 'dkdkd/fdfd/dfdf')
tmp = strsplit(a,'/')
tmp
tmp[[1]][1]
tmp[[2]][1] # 1번 부터 인덱싱
summary(tmp)
plot(a) # Error
unlist(tmp)
summary(unlist(tmp))
tmpAsFactor = as.factor(tmp[[1]][1])

summary(tmp)
tmp1 = unlist(tmp)
tmp2 = as.factor(tmp1) # factor로 만든 자료는 summary 와 plot 이 가능
summary(tmp2)
plot(tmp2)
strsplit(tmp2, '-') # Error : factor는 strsplit 안됨.
strsplit(as.character(tmp),'-') # character로 변환해서 가능
# factor형은 strsplit 안됨
b = as.factor(a)
strsplit(b,'/') # Error
plot(b)

# levels 변경
# categorical 함수 (Python)
아무리 좋은 문자라도 숫자로 전환하지 않으면 사용할 수 없음