# DataFrame
# matrix와 비슷하지만 특정 열을 잘라서 보았을 때 값들이 동일하면 서로 다른 자료형을 가지는 것이 가능
# 보통 여러 개의 벡터를 결합하는 형태로 생성
# 열을 field, 변수, item 이라고 함
# iris 데이터셋

str(iris)

# iris 분석
# iris[행,열]
iris
iris[,c(1:2)] # 1-2열 모든 행
iris[,c(1,3,5)] # 1,3,5열 모든 행
iris[,c('Sepal.Length', 'Species')] # 특정 열 모든 행
iris[1:5,] # 1-5행 모든열
iris[1:5,c(1,3)] # 1-5행, 1,3 열