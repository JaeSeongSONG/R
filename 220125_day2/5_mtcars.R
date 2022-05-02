# R에는 내장데이터를 많이 제공
# 자동차 연비와 관련된 mtcars
mtcars # read 없는 자료는 내장자료


# 엑셀로 보면 ob는 1,2,3 var는 a,b,c
mtcars
str(mtcars) 

# 위에서 3개만 출력
head(mtcars,3) 

# 왼쪽 한열은 인덱스 열로써 포함하지 않음, matrix가 같은 자료형으로 이루어져 있어야 하기 때문

# 고르게 분포되어있는 기준: 중앙값과 평균값이 비슷한가
summary(mtcars) 

# 데이터의 산점도
plot(mtcars$cyl) 
mtcars$cyl

# 데이터를 factor로 묶기
df = factor(mtcars$cyl)
df
summary(factor(mtcars$cyl)) # 4가 11, 6이 7, 8이 14

# 이름 확인 (같은 명령)
names(summary(factor(mtcars$cyl)))
# levels 확인
levels(factor(mtcars$cyl))
# unique 확인 # sorting이 없음 # 맨위부터 중복 제거 후 출력
unique(mtcars$cyl)

# Names 는 한줄로만 나오지만 데이터는 무수히 나올 수 있음
tmp = summary(factor(mtcars$cyl))
tmp
names(tmp) = c('cyl:4', 'cyl:6','cyl:8')
str(tmp)
tmp[1]


### split(자료, 기준) 작업하면 리스트화됨
tmp = split(mtcars, mtcars$cyl)
str(tmp)
split(tmp[[1]], tmp[[1]]$am) # split 중복 2번
split(tmp[[1]], tmp[[1]][9]) # 2개 동일







