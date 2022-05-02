#################################################################################

# 연관성 분석 (장바구니 분석)

# 지도 학습: y 값이 있음
# 비지도 학습: y 값이 없음

# 지지도 = A 교집합 B
# 신뢰도 = A 교집합 B / A
# 향상도 = A 교집합 B / A * B

# 트랜잭션 파일: 주 파일(master file)의 변경 사항을 일시적으로 저장하고 있는 파일
# 마스터파일: 자료 처리를 수행하는 데 있어 중심이 되는 기본 파일

#################################################################################

install.packages('arules')
library(arules)

tran = read.transactions('C:/Sources/StudyR/day5/tran.txt',format='basket',sep=',')
tran

# 넥타이, 셔츠, 양말 # 1번 트랜잭션
# 양말, 벨트, 장갑, 셔츠 # 2번 트랜잭션
# 지갑, 넥타이, 셔츠 # 3번 트랜잭션
# 양말, 벨트, 장갑, 바지 # 4번 트랜잭션

str(tran)
head(tran)
class(tran)

tran@data # 컴퓨터는 행렬로 받아들임
tran@data@i

str(inspect(tran)) # 구조

rule <- apriori(tran, parameter = list(supp = 0.3, conf = 0.1))
# 18개의 룰: supp (지지도) 의 조정에 따라 0개의 룰이 나오면 다음으로 넘어갈 수 없음
str(rule)
inspect(rule)

# lhs rhs =  

#################################################################################

# 시각화 패키지 

install.packages('arulesViz')
library(arulesViz)
plot(rule,method = 'graph', control = list(type = 'items'))




