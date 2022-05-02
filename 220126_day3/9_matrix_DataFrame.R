# 데이터셋의 기본정보
# 빈도수 분석(모든 설문지에서 많이 나온 단어수로 이슈를 찾음) => 시각화: 워드 클라우드
# 연관성 분석(matrix 구조)

### Matrix

# 여러개의 벡터를 모아놓은 것
# DataFrame과는 다른 점: 모든 자료의 자료형이 동일함
# 영문 텍스트 분석에 특화된 tm패키지 등에 매트릭스 사용
# konlpy 패키지 사용 가능

## Matrix 생성 (저장될 값, 행 개수, 열 개수, 열 방향으로 / 행 방향으로)

z <- matrix(1:20, nrow=4, ncol=5, byrow = T)
z

x <- 1:4 # 벡터 생성
y <- 5:8
z <- matrix(1:20, nrow=4, ncol = 5)

m1 <- cbind(x,y) # 열 방향으로 결합
m1
m2 <- rbind(x,y) # 행 방향으로 결합
m2

z[2,3] # z의 2행 3열 추출

rownames(z) <- c(1,2,3,4) # 행 이름 붙이기
colnames(z) <- c('a', 'b', 'v', 'd','sd') # 열 이름 붙이기
z

# 행과 열의 개수
dim(iris)

# 행의 개수
nrow(iris)

# 열의 개수
ncol(iris)

# 컬럼의 이름
colnames(iris)

# 행의 이름
rownames(iris)

# 데이터셋 요약정보
str(iris)

# 열별 합계, 평균, 행별 합계, 평균
colSums(iris[,-5]) # 5열을 빼고
colMeans(iris[,-5])
rowSums(irirs[,-5])
rowMeans(iris[,-5])

